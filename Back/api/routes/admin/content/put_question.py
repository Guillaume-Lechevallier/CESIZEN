from flask import Blueprint, request, jsonify

from api.utils.admin.admin_get_id_by_token import admin_get_id_by_token
from api.utils.db import get_db_connection

put_question_bp = Blueprint('put_question', __name__)

@put_question_bp.route('/content/questions/<int:id>', methods=['PUT'])
def update_question(id):
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
            "UPDATE questionnaire SET nom_question = %s, points = %s WHERE id = %s",
            (nom_question, points, id)
        )
        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({"message": "Question mise à jour"}), 200

    except Exception as e:
        print("Erreur PUT :", e)
        return jsonify({"error": str(e)}), 500
