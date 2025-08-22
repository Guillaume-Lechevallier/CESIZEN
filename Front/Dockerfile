# Front/Dockerfile
FROM node:20-alpine AS build
WORKDIR /app

COPY Front/package*.json ./
RUN npm ci

COPY Front/ ./
RUN npm run build

FROM nginx:alpine
COPY Front/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist/ /usr/share/nginx/html/
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=5s --retries=5 CMD wget -qO- http://localhost || exit 1

