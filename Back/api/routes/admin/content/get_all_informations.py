from flask import Blueprint, jsonify, request

from api.utils.admin.admin_get_id_by_token import admin_get_id_by_token
from api.utils.db import get_db_connection

get_all_informations_bp = Blueprint('get_all_informations', __name__)

@get_all_informations_bp.route('/admin/informations', methods=['GET'])
def get_all_informations():
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
        cursor = conn.cursor(dictionary=True)

        cursor.execute("""
            SELECT id, name, profile_pic, content, created_at
            FROM informations_liste
            ORDER BY created_at DESC
        """)
        results = cursor.fetchall()
        for row in results:
            row['created_at'] = row['created_at'].strftime('%Y-%m-%d %H:%M:%S')

        cursor.close()
        conn.close()
        return jsonify(results), 200

    except Exception as e:
        print("Erreur GET infos :", e)
        return jsonify({"error": str(e)}), 500
