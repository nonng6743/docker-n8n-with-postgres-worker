#!/bin/sh
set -e

# Start Redis with password if provided, otherwise without password
if [ -n "$REDIS_PASSWORD" ]; then
    exec redis-server --requirepass "$REDIS_PASSWORD" --appendonly yes
else
    exec redis-server --appendonly yes
fi
