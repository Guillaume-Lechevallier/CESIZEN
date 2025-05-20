from flask import jsonify, Blueprint, request
from api.utils.db import get_db_connection
from api.utils.get_id_by_token import get_id_by_token  # adapte selon ton projet

get_one_information_bp = Blueprint('get_one_information', __name__)

@get_one_information_bp.route('/content/one_information/<path:id>', methods=['GET'])
def get_one_information(id):
    token = request.headers.get('token')
    if not token:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        query = "SELECT id,name, profile_pic, content, created_at FROM informations_liste WHERE id = %s ORDER BY RAND() LIMIT 1"
        cursor.execute(query, (id,))
        post = cursor.fetchone()

        if post:
            post['created_at'] = post['created_at'].strftime('%Y-%m-%d %H:%M:%S')
        else:
            jsonify({"error": "Post non trouvé"}), 404

        return jsonify(post), 200

    id_user = get_id_by_token(token)
    if not id_user:
        return jsonify({"error": "Utilisateur non identifié"}), 403

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    # 🔹 Récupération du post spécifique
    query = """
        SELECT id, name, profile_pic, content, created_at
        FROM informations_liste
        WHERE id = %s
        LIMIT 1
    """
    cursor.execute(query, (id,))
    post = cursor.fetchone()

    if not post:
        return jsonify({"error": "Post non trouvé"}), 404

    # 🔹 Vérifie si c’est dans les favoris
    fav_query = """
        SELECT 1 FROM information_favori
        WHERE id_user = %s AND id_info = %s
        LIMIT 1
    """
    cursor.execute(fav_query, (id_user, id))
    is_favorite = cursor.fetchone() is not None

    post['created_at'] = post['created_at'].strftime('%Y-%m-%d %H:%M:%S')
    post['is_favorite'] = is_favorite

    return jsonify(post), 200
