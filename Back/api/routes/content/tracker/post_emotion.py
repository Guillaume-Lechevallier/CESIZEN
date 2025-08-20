from flask import jsonify, Blueprint, request
from datetime import datetime, date
from api.utils.db import get_db_connection
from api.utils.get_id_by_token import get_id_by_token

post_emotion_bp = Blueprint('post_emotion', __name__)

@post_emotion_bp.route('/content/post_emotion', methods=['POST'])
def post_emotion():
    try:
        # Authentification par token
        token = request.headers.get("token")
        if not token:
            return jsonify({"error": "Token manquant"}), 401

        id_user = get_id_by_token(token)
        if not id_user:
            return jsonify({"error": "Utilisateur non reconnu"}), 403

        # Lecture du JSON envoyé
        data = request.get_json()
        emotion = data.get("emotion")
        sous_emotion = data.get("sous_emotion")

        if not emotion or not sous_emotion:
            return jsonify({"error": "Données incomplètes"}), 400

        # Connexion DB
        connection = get_db_connection()
        cursor = connection.cursor()

        # Vérifie si la sous-émotion existe déjà aujourd’hui
        cursor.execute("""
            SELECT 1 FROM user_emotion
            WHERE id_user = %s AND sous_emotion = %s AND created_date = CURDATE()
        """, (id_user, sous_emotion))

        if cursor.fetchone():
            return jsonify({"error": "Cette sous-émotion a déjà été enregistrée aujourd’hui."}), 409

        # Insère la donnée
        cursor.execute("""
            INSERT INTO user_emotion (id_user, emotion, sous_emotion, created_at, created_date)
            VALUES (%s, %s, %s, %s, %s)
        """, (id_user, emotion, sous_emotion, datetime.utcnow(), date.today()))

        connection.commit()
        return jsonify({"message": "Émotion enregistrée"}), 200

    except Exception as e:
        print(f"Erreur : {str(e)}")
        return jsonify({
            "error": "Une erreur est survenue",
            "details": str(e)
        }), 500
