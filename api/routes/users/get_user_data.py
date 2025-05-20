
from flask import Blueprint, jsonify, request

from api.utils.db import get_db_connection

get_user_data_bp = Blueprint('get_user_data', __name__)

@get_user_data_bp.route('/get_user_data', methods=['GET'])
def get_user_data():
    token = request.headers.get('token')

    if not token:
        return jsonify({"error": "Token manquant dans les headers"}), 400

    try:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        query = "SELECT id FROM authentification_token WHERE token = %s"
        cursor.execute(query, (token,))
        result = cursor.fetchone()

        if result:
            user_id = result['id']

            query_user = "SELECT firstname, lastname, birth_date, email FROM users WHERE id = %s"
            cursor.execute(query_user, (user_id,))
            user_data = cursor.fetchone()

            if user_data:
                return jsonify({
                    "nom": user_data['lastname'],
                    "prenom": user_data['firstname'],
                    "birth_date": user_data['birth_date'].strftime('%d/%m/%Y'),
                    "email": user_data['email']
                }), 200
            else:
                return jsonify({"error": "Utilisateur non trouvé"}), 404
        else:
            return jsonify({"error": "Token invalide ou non trouvé"}), 404

    except Exception as e:
        return jsonify({"error": "Une erreur est survenue", "details": str(e)}), 500

    finally:
        cursor.close()
        connection.close()
