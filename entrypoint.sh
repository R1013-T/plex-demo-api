#!/bin/bash
set -e

# Ensure the database is available
echo "Waiting for database to be ready..."
sleep 20s

# Run database migrations
echo "Running database migrations..."
bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:setup

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
