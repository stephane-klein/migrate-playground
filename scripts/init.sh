#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

cat << EOF | docker compose exec -T postgres sh -c "psql --quiet -U \$POSTGRES_USER \$POSTGRES_DB"
    CREATE USER appuser PASSWORD 'password';
    CREATE DATABASE app WITH OWNER appuser;
    CREATE DATABASE app_shadow WITH OWNER appuser;
EOF

pnpm run migrate:reset --erase
pnpm run migrate:status
