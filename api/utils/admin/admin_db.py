import mysql.connector
from api.config.config import Config

def admin_get_db_connection():
    return mysql.connector.connect(**Config.DB_CONFIG) 