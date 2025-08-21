import os


class Config:
    DB_CONFIG = {
        'host': os.getenv('DB_HOST', 'localhost'),
        'user': os.getenv('DB_USER', 'root'),
        'password': os.getenv('DB_PASS', 'root'),
        'database': os.getenv('DB_NAME', 'cesizen'),
        'port': int(os.getenv('DB_PORT', 3306)),
    }

    EMAIL_CONFIG = {
        'from_address': os.getenv('EMAIL_FROM', 'informatiquecaentraining@gmail.com'),
        'smtp_server': os.getenv('SMTP_SERVER', 'smtp.gmail.com'),
        'smtp_port': int(os.getenv('SMTP_PORT', 587)),
        'login': os.getenv('SMTP_LOGIN', 'informatiquecaentraining@gmail.com'),
        'password': os.getenv('SMTP_PASSWORD', 'mhdp fsgw lbrc dhwb'),
    }

    SECRET_KEY = os.getenv('SECRET_KEY', 'dev-key-123')
    CORS_ORIGINS = os.getenv('CORS_ORIGINS', '*')
