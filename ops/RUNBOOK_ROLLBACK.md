# Rollback Runbook
1. SSH to server.
2. Identify previous tag.
3. `docker compose -f docker-compose.prod.yml down`.
4. `docker pull ${DOCKER_REPO}/frontend:<previous>` and same for backend and nginx.
5. Update compose file environment if needed.
6. `docker compose -f docker-compose.prod.yml up -d` with previous tag.
7. Verify healthchecks.
