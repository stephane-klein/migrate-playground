#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

docker compose exec postgres sh -c "psql -U appuser app"
