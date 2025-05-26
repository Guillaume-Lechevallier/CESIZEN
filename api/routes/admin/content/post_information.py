from flask import Blueprint, request, jsonify

from api.utils.admin.admin_get_id_by_token import admin_get_id_by_token
from api.utils.db import get_db_connection
from datetime import datetime

post_information_bp = Blueprint('post_information', __name__)

@post_information_bp.route('/admin/informations', methods=['POST'])
def create_information():
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
            INSERT INTO informations_liste (name, profile_pic, content, created_at)
            VALUES (%s, %s, %s, %s)
        """, (name, profile_pic, content, datetime.now()))

        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({"message": "Information ajoutée"}), 201

    except Exception as e:
        print("Erreur POST infos :", e)
        return jsonify({"error": str(e)}), 500
