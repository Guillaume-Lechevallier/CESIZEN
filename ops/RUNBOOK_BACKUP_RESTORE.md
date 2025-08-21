# Backup and Restore Runbook

## Backup
1. Run `scripts/backup_db.sh`.
2. Store the generated `.sql.gpg` file securely.
3. Rotate old backups according to policy.

## Restore
1. Locate desired backup file.
2. Run `scripts/restore_db.sh <backup-file>`.
3. Confirm data integrity.
