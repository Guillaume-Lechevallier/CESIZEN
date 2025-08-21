#!/bin/sh
set -e
[ -f .env ] && . .env
TS=$(date +%F_%H-%M-%S)
FILE="backup_${TS}.sql"
mysqldump -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$FILE"
gpg --symmetric --cipher-algo AES256 "$FILE"
rm "$FILE"
echo "Backup stored in ${FILE}.gpg"
