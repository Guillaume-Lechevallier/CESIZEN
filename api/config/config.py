import os

class Config:
    # Configuration de la base de données
    DB_CONFIG = {
        'host': 'localhost',
        'user': 'root',
        'password': 'root',
        'database': 'cesizen'
    }
    
    # Configuration email
    EMAIL_CONFIG = {
        'from_address': 'informatiquecaentraining@gmail.com',
        'smtp_server': 'smtp.gmail.com',
        'smtp_port': 587,
        'login': 'informatiquecaentraining@gmail.com',
        'password': 'mhdp fsgw lbrc dhwb'
    }
    
    # Autres configurations
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'dev-key-123' 