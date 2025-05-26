from flask import Blueprint, jsonify, request

from api.utils.admin.admin_get_id_by_token import admin_get_id_by_token
from api.utils.db import get_db_connection
import json

post_exercise_bp = Blueprint('post_exercise', __name__)

@post_exercise_bp.route('/content/breathing-exercises', methods=['POST'])
def create_breathing_exercise():
    try:
        token = request.headers.get('token')
        if token:
            id_user = admin_get_id_by_token(token)
            if not id_user:
                return jsonify("vous n'êtes pas administrateur"), 403
            print(id_user)
        else:
            return jsonify("vous devez être authentifié"),403
        data = request.get_json()
        name = data.get('name')
        exercice = json.dumps(data.get('exercice'))

        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute(
            "INSERT INTO exercice_respiration (name, exercice) VALUES (%s, %s)",
            (name, exercice)
        )
        conn.commit()

        cursor.close()
        conn.close()

        return jsonify({"message": "Exercice créé avec succès"}), 201

    except Exception as e:
        print("error : ", e)
        return jsonify({"error": str(e)}), 500
