from flask import Blueprint, request, jsonify

from api.utils.admin.admin_get_id_by_token import admin_get_id_by_token
from api.utils.db import get_db_connection

put_information_bp = Blueprint('put_information', __name__)

@put_information_bp.route('/admin/informations/<int:id>', methods=['PUT'])
def update_information(id):
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
        content = data.get('content')
        profile_pic = data.get('profile_pic', '')

        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("""
            UPDATE informations_liste
            SET name = %s, profile_pic = %s, content = %s
            WHERE id = %s
        """, (name, profile_pic, content, id))

        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({"message": "Information mise à jour"}), 200

    except Exception as e:
        print("Erreur PUT infos :", e)
        return jsonify({"error": str(e)}), 500
