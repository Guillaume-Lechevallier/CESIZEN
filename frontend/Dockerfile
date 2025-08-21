# Frontend build stage
FROM node:20-alpine AS build
WORKDIR /app
COPY Front/package*.json ./
RUN npm ci --legacy-peer-deps
COPY Front/ ./
RUN npm run build --configuration production

# Nginx stage serving static files
FROM nginx:alpine
COPY --from=build /app/dist/ /usr/share/nginx/html
# simple healthcheck endpoint
RUN echo 'ok' > /usr/share/nginx/html/healthz
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost/healthz || exit 1
