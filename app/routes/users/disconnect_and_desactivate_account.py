import datetime

import bcrypt
from flask import request, jsonify, Blueprint

from app.utils.db import get_db_connection
from app.utils.email import send_email_desactivation_compte
disconnect_and_desactivate_account_bp = Blueprint('disconnect_and_desactivate_account', __name__)


@disconnect_and_desactivate_account_bp.route('/disconnect_and_desactivate_account', methods=['GET'])
def disconnect_and_desactivate_account():
    email = request.headers.get('email')
    password = request.headers.get('password')
    token = request.headers.get('token')

    if not email or not password or not token:
        return jsonify({"error": "Email, mot de passe ou token manquant dans les headers."}), 400

    connection = None
    cursor = None

    try:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        query_user = "SELECT id, password, email FROM users WHERE email = %s"
        cursor.execute(query_user, (email,))
        user = cursor.fetchone()

        if not user or not bcrypt.checkpw(password.encode('utf-8'), user['password'].encode('utf-8')):
            return jsonify({"auth": False, "error": "Email ou mot de passe incorrect."}), 401

        user_id = user['id']

        query_token = "SELECT * FROM authentification_token WHERE id = %s AND token = %s"
        cursor.execute(query_token, (user_id, token))
        valid_token = cursor.fetchone()

        if not valid_token:
            return jsonify({"auth": False, "error": "Token invalide."}), 403

        delete_query = "DELETE FROM authentification_token WHERE id = %s"
        cursor.execute(delete_query, (user_id,))

        deactivate_query = "UPDATE users SET actif = 0 WHERE id = %s"
        cursor.execute(deactivate_query, (user_id,))

        deletion_date = (datetime.now() + datetime.timedelta(days=30)).strftime('%Y-%m-%d %H:%M:%S')
        update_date_query = "UPDATE users SET date_suppression_compte = %s WHERE id = %s"
        cursor.execute(update_date_query, (deletion_date, user_id))

        connection.commit()

        send_email_desactivation_compte(user['email'], deletion_date)

        return jsonify(
            {"auth": True, "message": "Compte désactivé avec succès.", "date_suppression": deletion_date}), 200

    except Exception as e:
        return jsonify({"error": f"Une erreur est survenue : {str(e)}"}), 500

    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()

