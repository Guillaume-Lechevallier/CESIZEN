from flask import jsonify, Blueprint, request
from datetime import datetime, timedelta
from app.utils.db import get_db_connection
from app.utils.get_id_by_token import get_id_by_token

get_dashboard_tracker_bp = Blueprint('get_dashboard_tracker', __name__)

@get_dashboard_tracker_bp.route('/user/get_dashboard_tracker', methods=['GET'])
def get_dashboard_tracker():
    try:
        # Authentification par token
        token = request.headers.get("token")
        if not token:
            return jsonify({"error": "Token manquant"}), 401

        id_user = get_id_by_token(token)
        if not id_user:
            return jsonify({"error": "Utilisateur non reconnu"}), 403

        # Calcul de la date il y a 3 mois
        three_months_ago = datetime.utcnow() - timedelta(days=90)

        # Connexion DB
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        # Récupération des émotions
        cursor.execute("""
            SELECT emotion, sous_emotion, created_at, created_date
            FROM user_emotion
            WHERE id_user = %s AND created_at >= %s
            ORDER BY created_at DESC
        """, (id_user, three_months_ago))

        emotions = cursor.fetchall()

        return jsonify({
            "emotions": emotions,
            "count": len(emotions)
        }), 200

    except Exception as e:
        print(f"Erreur : {str(e)}")
        return jsonify({
            "error": "Une erreur est survenue",
            "details": str(e)
        }), 500
