# Secrets Management

## Production Secrets
- Use Docker secrets for sensitive values.
- Expect files at `/run/secrets/db_user`, `/run/secrets/db_pass`, and `/run/secrets/jwt_secret`.

## Jenkins Deployment
- Jenkins must export required variables such as database credentials and `JWT_SECRET`.
- Use Jenkins credentials store for `dockerhub`, `sonar-token`, and SSH keys.

## Key Rotation
- Rotate secrets regularly and remove old values from the server.
- Store backups securely and respect retention policies.

## Compose Example
```yaml
services:
  backend:
    secrets:
      - db_user
      - db_pass
      - jwt_secret
secrets:
  db_user:
    file: ./secrets/db_user.txt
  db_pass:
    file: ./secrets/db_pass.txt
  jwt_secret:
    file: ./secrets/jwt_secret.txt
```

## Notes
- Never commit `.env` files or secret material.
