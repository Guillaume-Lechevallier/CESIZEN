from flask import jsonify
from app.utils.db import get_db_connection

def get_id_by_token(token):
    if not token:
        return jsonify({"error": "Token manquant dans les headers"}), 400

    try:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        query = "SELECT id FROM authentification_token WHERE token = %s"
        cursor.execute(query, (token,))
        result = cursor.fetchone()

        if result:
            return result['id']
        else:
            return jsonify({"error": "Token invalide ou non trouvé"}), 404

    except Exception as e:
        return jsonify({"error": "Une erreur est survenue", "details": str(e)}), 500

    finally:
        cursor.close()
        connection.close()