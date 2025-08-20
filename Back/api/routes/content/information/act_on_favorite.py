from flask import jsonify, Blueprint, request
from api.utils.db import get_db_connection
from api.utils.get_id_by_token import get_id_by_token

set_favorite_bp = Blueprint('set_favorite', __name__)

@set_favorite_bp.route('/content/toggle_favorite/<int:id_info>', methods=['POST'])
def toggle_favorite(id_info):
    token = request.headers.get("token")
    if not token:
        return jsonify({"error": "Token manquant"}), 401

    id_user = get_id_by_token(token)
    if not id_user:
        return jsonify({"error": "Utilisateur non reconnu"}), 403

    connection = get_db_connection()
    cursor = connection.cursor()

    # Vérifie si l'info est déjà en favori
    cursor.execute(
        "SELECT 1 FROM information_favori WHERE id_user = %s AND id_info = %s",
        (id_user, id_info)
    )
    exists = cursor.fetchone()

    if exists:
        # Supprime le favori
        cursor.execute(
            "DELETE FROM information_favori WHERE id_user = %s AND id_info = %s",
            (id_user, id_info)
        )
        connection.commit()
        return jsonify({"is_favorite": False}), 200
    else:
        # Ajoute le favori
        cursor.execute(
            "INSERT INTO information_favori (id_user, id_info) VALUES (%s, %s)",
            (id_user, id_info)
        )
        connection.commit()
        return jsonify({"is_favorite": True}), 200
