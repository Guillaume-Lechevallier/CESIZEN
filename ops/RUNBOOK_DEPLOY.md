# Deployment Runbook
1. SSH to server.
2. Pull images: `docker compose -f docker-compose.prod.yml pull`.
3. Apply compose: `docker compose -f docker-compose.prod.yml up -d --remove-orphans`.
4. Verify with `curl -f https://<domain>/healthz`.
