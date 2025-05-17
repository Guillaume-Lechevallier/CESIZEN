from flask import jsonify, Blueprint, request
from app.utils.db import get_db_connection
from app.utils.get_id_by_token import get_id_by_token

get_all_favorite_info_bp = Blueprint('get_all_favorite_info', __name__)

@get_all_favorite_info_bp.route('/content/favorite', methods=['GET'])
def get_all_favorite_info():
    token = request.headers.get("token")
    id_user = get_id_by_token(token)

    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    # Étape 1 : Récupérer tous les id_info favoris de l'utilisateur
    cursor.execute("SELECT id_info FROM information_favori WHERE id_user = %s", (id_user,))
    favorite_ids = cursor.fetchall()

    if not favorite_ids:
        return jsonify([]), 200

    # Extraire les IDs dans une liste
    id_list = [str(row['id_info']) for row in favorite_ids]

    # Construction dynamique de la requête avec IN
    format_strings = ','.join(['%s'] * len(id_list))
    query = f"SELECT id, name, profile_pic, content, created_at FROM informations_liste WHERE id IN ({format_strings}) ORDER BY RAND()"
    cursor.execute(query, id_list)

    posts = cursor.fetchall()

    # Formatage des dates
    for post in posts:
        if post['created_at']:
            post['created_at'] = post['created_at'].strftime('%Y-%m-%d %H:%M:%S')

    return jsonify(posts), 200
