# Front/Dockerfile
FROM node:20-alpine AS build
WORKDIR /app

# 1) profiter du cache : copier les manifests
COPY Front/package.json Front/package-lock.json ./

# 2) install déterministe (nécessite le lockfile commité)
RUN npm ci

# 3) copier le code et builder
COPY Front/ ./
RUN npm run build

# 4) runtime nginx
FROM nginx:alpine
COPY Front/nginx.conf /etc/nginx/conf.d/default.conf
# adapte le chemin si ton dist s'appelle autrement
COPY --from=build /app/dist/ /usr/share/nginx/html/
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=5s --retries=5 CMD wget -qO- http://localhost || exit 1

