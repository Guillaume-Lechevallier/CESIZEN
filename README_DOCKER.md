# Docker Setup for CESIZEN

## Prerequisites
- Docker and Docker Compose
- `.env` file based on `.env.example`

## Development
```bash
docker compose -f docker-compose.dev.yml up -d
```

## Production
```bash
docker compose -f docker-compose.prod.yml up -d
```

## Stop
```bash
docker compose down
```

## Reset Database
```bash
rm -rf data/db
```

## Debugging
- Use `docker compose logs -f <service>`
- Tokens are never stored in plain text; only hashes are persisted.
