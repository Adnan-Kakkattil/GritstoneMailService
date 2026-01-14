CREATE TABLE IF NOT EXISTS accounts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email_address TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Add account_id to emails for better querying later
ALTER TABLE emails ADD COLUMN IF NOT EXISTS account_id UUID REFERENCES accounts(id);

