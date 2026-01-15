use mailin::{Handler, Response};
use mailin_embedded::{Server as SmtpServer, SslConfig};
use std::net::IpAddr;
use tracing::{info, error};
use sqlx::postgres::PgPoolOptions;
use axum::{routing::post, Json, Router, extract::State};
use serde::{Deserialize, Serialize};
use lettre::{Message, Tokio1Executor, Transport, AsyncSmtpTransport};
use lettre::transport::smtp::client::Tls;
use std::sync::Arc;

#[derive(Clone)]
struct AppState {
    pool: sqlx::PgPool,
    rt: tokio::runtime::Handle,
}

#[derive(Clone)]
struct MailHandler {
    state: AppState,
    current_sender: String,
    current_recipient: String,
    current_data: Vec<u8>,
}

impl MailHandler {
    fn new(state: AppState) -> Self {
        Self {
            state,
            current_sender: String::new(),
            current_recipient: String::new(),
            current_data: Vec::new(),
        }
    }
}

impl Handler for MailHandler {
    fn helo(&mut self, _ip: IpAddr, _domain: &str) -> Response {
        info!("HELO from domain: {}", _domain);
        Response::custom(250, "Gritstone Mail Core ready".to_string())
    }

    fn mail(&mut self, _ip: IpAddr, _from: &str, _params: &str) -> Response {
        info!("MAIL FROM: {} with params: {}", _from, _params);
        self.current_sender = _from.to_string();
        Response::custom(250, "OK".to_string())
    }

    fn rcpt(&mut self, _to: &str) -> Response {
        info!("RCPT TO: {}", _to);
        self.current_recipient = _to.to_string();
        Response::custom(250, "OK".to_string())
    }

    fn data_start(&mut self, _domain: &str, _from: &str, _is_8bit: bool, _rcpt: &[String]) -> Response {
        info!("DATA start from {}", _from);
        self.current_data.clear();
        Response::custom(354, "Go ahead".to_string())
    }

    fn data(&mut self, _buf: &[u8]) -> std::io::Result<()> {
        self.current_data.extend_from_slice(_buf);
        Ok(())
    }

    fn data_end(&mut self) -> Response {
        info!("DATA end, saving to database...");
        
        let pool = self.state.pool.clone();
        let sender = self.current_sender.clone();
        let recipient = self.current_recipient.clone();
        let data_len = self.current_data.len();
        let body = String::from_utf8_lossy(&self.current_data).to_string();

        self.state.rt.block_on(async move {
            let res = sqlx::query(
                "INSERT INTO emails (sender, recipient, body_plain) VALUES ($1, $2, $3)"
            )
            .bind(sender)
            .bind(recipient)
            .bind(body)
            .execute(&pool)
            .await;

            match res {
                Ok(_) => info!("Saved incoming email to database ({} bytes)", data_len),
                Err(e) => error!("Failed to save incoming email: {}", e),
            }
        });

        Response::custom(250, "Message received and stored".to_string())
    }
}

#[derive(Deserialize)]
struct InternalSendRequest {
    sender: String,
    to: String,
    subject: String,
    body: String,
}

#[derive(Serialize)]
struct InternalSendResponse {
    success: bool,
    message: String,
}

async fn internal_send_handler(
    State(state): State<AppState>,
    Json(payload): Json<InternalSendRequest>,
) -> Json<InternalSendResponse> {
    info!("Internal request to send mail from {} to {}", payload.sender, payload.to);

    // 1. Resolve MX record and send directly
    let domain = match payload.to.split("@").nth(1) {
        Some(d) => d,
        None => return Json(InternalSendResponse { success: false, message: "Invalid recipient".to_string() }),
    };

    // Lettre will handle MX lookup if we use AsyncSmtpTransport::relay
    let email = match Message::builder()
        .from(payload.sender.parse().unwrap())
        .to(payload.to.parse().unwrap())
        .subject(payload.subject)
        .body(payload.body) {
            Ok(m) => m,
            Err(e) => return Json(InternalSendResponse { success: false, message: format!("Build error: {}", e) }),
        };

    // For real world delivery without relay, we need to find MX and connect to port 25
    // Lettre handles this via AsyncSmtpTransport::builder_relay(domain)
    let mailer = match AsyncSmtpTransport::<Tokio1Executor>::builder_relay(domain) {
        Ok(builder) => builder.port(25).tls(Tls::None).build(), // Use None first for direct MX delivery, opportunistic TLS can be added
        Err(e) => return Json(InternalSendResponse { success: false, message: format!("DNS error: {}", e) }),
    };

    match mailer.send(email).await {
        Ok(_) => {
            info!("Successfully delivered mail to {}", payload.to);
            Json(InternalSendResponse { success: true, message: "Delivered".to_string() })
        },
        Err(e) => {
            error!("Failed to deliver mail to {}: {}", payload.to, e);
            Json(InternalSendResponse { success: false, message: format!("Delivery failed: {}", e) })
        }
    }
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    tracing_subscriber::fmt::init();
    info!("Starting Gritstone Mail Core...");

    dotenvy::dotenv().ok();
    let database_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");

    let pool = PgPoolOptions::new()
        .max_connections(5)
        .acquire_timeout(std::time::Duration::from_secs(30))
        .connect(&database_url)
        .await?;

    sqlx::migrate!("./migrations").run(&pool).await?;
    info!("Database initialized and migrations applied.");

    let state = AppState {
        pool: pool.clone(),
        rt: tokio::runtime::Handle::current(),
    };

    // Start Internal API server (for Go to trigger sends)
    let app = Router::new()
        .route("/internal/send", post(internal_send_handler))
        .with_state(state.clone());

    let api_addr = "0.0.0.0:5000";
    info!("Internal API listening on {}", api_addr);
    let listener = tokio::net::TcpListener::bind(api_addr).await?;
    tokio::spawn(async move {
        axum::serve(listener, app).await.unwrap();
    });

    // Start SMTP server
    let smtp_port = std::env::var("SMTP_PORT").unwrap_or_else(|_| "2525".to_string());
    let smtp_addr = format!("0.0.0.0:{}", smtp_port);
    info!("SMTP server starting on {}", smtp_addr);

    let handler = MailHandler::new(state);
    let mut server = SmtpServer::new(handler);
    server.with_name("mail.nomadscipher.xyz")
          .with_addr(smtp_addr)
          .expect("Failed to bind to address");

    if let (Ok(cert), Ok(key)) = (std::env::var("SMTP_CERT_PATH"), std::env::var("SMTP_KEY_PATH")) {
        let ssl_config = SslConfig::SelfSigned { cert_path: cert, key_path: key };
        server.with_ssl(ssl_config)?;
    } else {
        info!("Starting without TLS (SMTP_CERT_PATH or SMTP_KEY_PATH not set)");
    }

    if let Err(e) = server.serve() {
        error!("SMTP server error: {}", e);
    }

    Ok(())
}

