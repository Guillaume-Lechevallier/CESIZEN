FROM nginx:alpine
COPY nginx/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /etc/letsencrypt /var/www/certbot
EXPOSE 80 443
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost/healthz || exit 1
