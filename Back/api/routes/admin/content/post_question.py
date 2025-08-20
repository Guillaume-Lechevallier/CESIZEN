from flask import Blueprint, request, jsonify

from api.utils.admin.admin_get_id_by_token import admin_get_id_by_token
from api.utils.db import get_db_connection

post_question_bp = Blueprint('post_question', __name__)

@post_question_bp.route('/content/questions', methods=['POST'])
def post_question():
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
        nom_question = data.get('nom_question')
        points = data.get('points', 0)

        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute(
            "INSERT INTO questionnaire (nom_question, points) VALUES (%s, %s)",
            (nom_question, points)
        )
        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({"message": "Question ajoutée"}), 201

    except Exception as e:
        print("Erreur POST :", e)
        return jsonify({"error": str(e)}), 500
