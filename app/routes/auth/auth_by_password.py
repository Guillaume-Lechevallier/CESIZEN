from flask import jsonify, request, Blueprint
import bcrypt
import random
import string
from datetime import datetime
from app.utils.db import get_db_connection

auth_by_password_bp = Blueprint('auth_by_password_bp', __name__)


@auth_by_password_bp.route('/auth/auth_by_password', methods=['GET'])
def auth_by_password():
    email = request.headers.get('email')
    password = request.headers.get('password')

    if not email or not password:
        return jsonify({"error": "Email ou mot de passe manquant dans les headers."}), 400

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    try:
        query = "SELECT id, password FROM users WHERE email = %s"
        cursor.execute(query, (email,))
        user = cursor.fetchone()

        if user and bcrypt.checkpw(password.encode('utf-8'), user['password'].encode('utf-8')):
            token = ''.join(random.choices(string.ascii_uppercase + string.digits, k=16))
            suppression_date = datetime.now()
            user_id = user['id']

            insert_query = """
            INSERT INTO authentification_token (id, suppression_date, token, type)
            VALUES (%s, %s, %s, %s)
            """
            cursor.execute(insert_query, (user_id, suppression_date, token, "web"))
            connection.commit()

            return jsonify({"auth": True, "token": token}), 200
        else:
            return jsonify({"auth": False, "error": "Email ou mot de passe incorrect."}), 200
    except Exception as e:
        return jsonify({"error": f"Une erreur est survenue : {str(e)}"}), 500
    finally:
        cursor.close()
        connection.close()
