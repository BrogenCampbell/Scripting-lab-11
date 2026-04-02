#!/bin/bash

CONTAINER_NAME="mydb"
DB_USER="postgres"
DBNAME="postgres"

echo "Connected to $CONTAINER_NAME"

docker exec -i "$CONTAINER_NAME" psql -U "$DB_USER" <<EOF

CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
	name TEXT,
	email TEXT );

INSERT INTO users (username, email)
VALUES ('John', 'John@generic.net')
ON CONFLICT (username)DO NOTHING;

SELECT * FROM users;
EOF

echo "Completed."
