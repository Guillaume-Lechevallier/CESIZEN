FROM python:3.12-alpine

WORKDIR /app
# deps système si besoin (bcrypt, etc.)
RUN apk add --no-cache gcc musl-dev libffi-dev

# 1) installer les deps AVANT de copier le code (cache docker)
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# 2) copier le code
COPY . /app

ENV FLASK_ENV=production
ENV PYTHONUNBUFFERED=1

EXPOSE 5000
# healthcheck optionnel
# HEALTHCHECK --interval=30s --timeout=5s --retries=5 CMD wget -qO- http://localhost:5000/healthz || exit 1

# Gunicorn (app:app si ton objet Flask s'appelle app dans app.py)
CMD ["gunicorn","-w","4","-k","gthread","--threads","2","-b","0.0.0.0:5000","app:app"]

