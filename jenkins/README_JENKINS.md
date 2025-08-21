# Jenkins dans Docker

## Lancement
```bash
docker compose -f docker-compose.jenkins.yml up -d --build
```
Jenkins sera disponible sur http://localhost:8080.

## Configuration initiale
- L'admin est créé via `JENKINS_ADMIN_ID` et `JENKINS_ADMIN_PASSWORD`
- Plugins installés : workflow-aggregator, docker-workflow, credentials, git
- Le socket Docker est monté pour construire/pusher des images

## CI/CD
- Créer un job multibranch pointant vers ce dépôt
- Ajouter un webhook GitHub
- Définir les credentials nécessaires (DockerHub, Sonar, SSH, ...)
