use mailin::{Handler, Response};
use mailin_embedded::{Server, SslConfig};
use std::net::IpAddr;
use tracing::{info, error};
use sqlx::postgres::PgPoolOptions;

#[derive(Clone)]
struct MailHandler {
    pool: sqlx::PgPool,
    rt: tokio::runtime::Handle,
    current_sender: String,
    current_recipient: String,
    current_data: Vec<u8>,
}

impl MailHandler {
    fn new(pool: sqlx::PgPool, rt: tokio::runtime::Handle) -> Self {
        Self {
            pool,
            rt,
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
        
        let pool = self.pool.clone();
        let sender = self.current_sender.clone();
        let recipient = self.current_recipient.clone();
        let data_len = self.current_data.len();
        
        let body = String::from_utf8_lossy(&self.current_data).to_string();

        self.rt.block_on(async move {
            let res = sqlx::query(
                "INSERT INTO emails (sender, recipient, body_plain) VALUES ($1, $2, $3)"
            )
            .bind(sender)
            .bind(recipient)
            .bind(body)
            .execute(&pool)
            .await;

            match res {
                Ok(_) => info!("Saved email to database ({} bytes)", data_len),
                Err(e) => error!("Failed to save email: {}", e),
            }
        });

        Response::custom(250, "Message received and stored".to_string())
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

    let smtp_addr = "0.0.0.0:2525";
    info!("SMTP server starting on {}", smtp_addr);

    let handler = MailHandler::new(pool, tokio::runtime::Handle::current());
    let mut server = Server::new(handler);
    server.with_name("gritstone-mail-core")
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

