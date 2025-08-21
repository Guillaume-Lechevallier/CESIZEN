FROM python:3.12-alpine
WORKDIR /app
ENV PYTHONUNBUFFERED=1
COPY Back/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY Back/ ./
COPY backend/gunicorn.conf.py ./
CMD ["gunicorn", "-c", "gunicorn.conf.py", "app:app"]
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost:5000/healthz || exit 1
