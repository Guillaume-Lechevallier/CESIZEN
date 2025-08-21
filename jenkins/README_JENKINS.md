# Jenkins Setup

1. Create a Multibranch Pipeline job pointing to the repository.
2. Configure GitHub webhook for push and pull request events.
3. Required credentials:
   - `dockerhub` (username/password)
   - `sonar-token` (Secret text)
   - `deploy_ssh` (SSH private key)
4. Global environment variables:
   - `SONAR_HOST_URL`
5. Agents must provide Docker and Docker Compose.
