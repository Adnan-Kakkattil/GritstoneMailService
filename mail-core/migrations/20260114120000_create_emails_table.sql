CREATE TABLE IF NOT EXISTS emails (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sender TEXT NOT NULL,
    recipient TEXT NOT NULL,
    subject TEXT,
    body_plain TEXT,
    received_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_emails_recipient ON emails(recipient);
CREATE INDEX idx_emails_received_at ON emails(received_at);

