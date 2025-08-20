from flask import jsonify, Blueprint, request
from datetime import date
import json

from api.utils.db import get_db_connection
from api.utils.get_id_by_token import get_id_by_token

get_emotion_list_bp = Blueprint('get_emotion_list', __name__)

@get_emotion_list_bp.route('/content/get_emotion_list', methods=['GET'])
def get_emotion_list():
    try:
        token = request.headers.get("token")
        if not token:
            return jsonify({"error": "Token manquant"}), 401

        id_user = get_id_by_token(token)
        if not id_user:
            return jsonify({"error": "Utilisateur non reconnu"}), 403

        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        # 1. Sous-émotions déjà soumises aujourd’hui
        cursor.execute("""
            SELECT sous_emotion FROM user_emotion
            WHERE id_user = %s AND created_date = CURDATE()
        """, (id_user,))
        already_sent = {row['sous_emotion'] for row in cursor.fetchall()}

        # 2. Liste complète des émotions
        cursor.execute("SELECT * FROM tracker_emotion_list")
        raw_emotions = cursor.fetchall()

        filtered_emotions = []

        for emotion in raw_emotions:
            raw_json = emotion.get("sous_emotion", "[]")
            parsed = json.loads(raw_json)

            # Filtre les sous-émotions envoyées
            filtered_sous = [s for s in parsed if s["nom"] not in already_sent]

            # Si des sous-émotions restent → on garde cette émotion
            if filtered_sous:
                emotion["sous_emotion"] = filtered_sous
                filtered_emotions.append(emotion)

        return jsonify(filtered_emotions), 200

    except Exception as e:
        print(f"Erreur : {str(e)}")
        return jsonify({"error": "Une erreur est survenue", "details": str(e)}), 500
