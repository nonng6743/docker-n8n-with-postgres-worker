#!/bin/sh
set -e

# Debug: Print environment variable
echo "REDIS_PASSWORD is set: $([ -n "$REDIS_PASSWORD" ] && echo "YES" || echo "NO")"
echo "REDIS_PASSWORD value: ${REDIS_PASSWORD:-<empty>}"

# Start Redis with password if provided, otherwise without password
if [ -n "$REDIS_PASSWORD" ]; then
    echo "Starting Redis with password protection..."
    exec redis-server --requirepass "$REDIS_PASSWORD" --appendonly yes
else
    echo "Starting Redis without password..."
    exec redis-server --appendonly yes
fi
