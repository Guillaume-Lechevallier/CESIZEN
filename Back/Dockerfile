FROM python:3.12-alpine
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN apk add --no-cache build-base libffi-dev
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000
# Utilise Gunicorn si disponible, sinon Flask
CMD ["sh", "-c", "gunicorn -c gunicorn.conf.py app:app || flask run --host=0.0.0.0 --port=5000"]
