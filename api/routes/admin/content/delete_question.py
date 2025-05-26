from flask import Blueprint, jsonify, request

from api.utils.admin.admin_get_id_by_token import admin_get_id_by_token
from api.utils.db import get_db_connection

delete_question_bp = Blueprint('delete_question', __name__)

@delete_question_bp.route('/content/questions/<int:id>', methods=['DELETE'])
def delete_question(id):
    try:
        token = request.headers.get('token')
        if token:
            id_user = admin_get_id_by_token(token)
            if not id_user:
                return jsonify("vous n'êtes pas administrateur"), 403
            print(id_user)
        else:
            return jsonify("vous devez être authentifié"),403
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("DELETE FROM questionnaire WHERE id = %s", (id,))
        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({"message": "Question supprimée"}), 200

    except Exception as e:
        print("Erreur DELETE :", e)
        return jsonify({"error": str(e)}), 500
