CREATE TABLE IF NOT EXISTS mailboxes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email_address TEXT UNIQUE NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Seed some test mailboxes
INSERT INTO mailboxes (email_address) VALUES 
('admin@gritstonemail.com'),
('test@example.com')
ON CONFLICT DO NOTHING;

