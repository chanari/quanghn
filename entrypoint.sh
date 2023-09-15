#!/bin/bash
set -e

# bundle install
bundle install

# Migrate
bundle exec rails db:create
bundle exec rails db:migrate

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

bundle exec rails server --port=3000 -b 0.0.0.0

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
