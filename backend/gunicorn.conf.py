import os

workers = int(os.getenv("GUNICORN_WORKERS", "4"))
threads = int(os.getenv("GUNICORN_THREADS", "2"))
timeout = 60
bind = "0.0.0.0:5000"
loglevel = os.getenv("LOG_LEVEL", "info")
