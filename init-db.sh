#!/bin/bash

# Connect to the database defined in your docker-compose (data_container)
psql -U postgres -d data_container <<EOF
-- Create the table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert a test user
INSERT INTO users (username, email)
VALUES ('jdoe', 'jdoe@example.com')
ON CONFLICT (username) DO NOTHING;

-- Show the results in the GitHub logs
\echo '--- CURRENT USERS TABLE ---'
SELECT * FROM users;
EOF
