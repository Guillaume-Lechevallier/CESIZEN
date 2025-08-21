#!/bin/sh
HOSTPORT=$1
shift
HOST="${HOSTPORT%%:*}"
PORT="${HOSTPORT##*:}"
until nc -z "$HOST" "$PORT"; do
  echo "Waiting for $HOSTPORT..."
  sleep 1
done
exec "$@"
