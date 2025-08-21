#!/bin/sh
set -e
FILE="$1"
[ -f .env ] && . .env
TMP=$(mktemp)
gpg --decrypt "$FILE" > "$TMP"
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$TMP"
rm "$TMP"
echo "Restored from $FILE"
