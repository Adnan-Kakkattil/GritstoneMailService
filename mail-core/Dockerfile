# Build Stage
FROM rust:1.81-bookworm AS builder

WORKDIR /usr/src/app
COPY . .

# Build the application
RUN cargo build --release

# Run Stage
FROM debian:bookworm-slim

# Install OpenSSL and other dependencies needed at runtime
RUN apt-get update && apt-get install -y \
    libssl3 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin

# Copy the binary from builder
COPY --from=builder /usr/src/app/target/release/mail-core .
# Copy migrations for startup
COPY --from=builder /usr/src/app/migrations ./migrations

# Expose SMTP port
EXPOSE 25
EXPOSE 2525

CMD ["./mail-core"]
