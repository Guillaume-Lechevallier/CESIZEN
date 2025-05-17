from flask import jsonify, Blueprint, request
from app.utils.db import get_db_connection
from app.utils.get_id_by_token import get_id_by_token

get_information_bp = Blueprint('get_information', __name__)

@get_information_bp.route('/content/information', methods=['GET'])
def get_information():
    try:
        token = request.headers.get('token')
        id_user = get_id_by_token(token) if token else None

        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        query = """
            SELECT id, name, profile_pic, content, created_at
            FROM informations_liste
            ORDER BY RAND()
            LIMIT 1
        """
        cursor.execute(query)
        post = cursor.fetchone()

        query = """
            SELECT COUNT(*)
            FROM information_historique
            WHERE id_info = %s
        """
        cursor.execute(query,(post['id'],))
        count = cursor.fetchone()
        if count['COUNT(*)']>=1:
            print("post déjà lu")
            while count['COUNT(*)']>=1:


                query = """
                    SELECT id, name, profile_pic, content, created_at
                    FROM informations_liste
                    WHERE id = %s
                """
                cursor.execute(query,(post['id']+1,))
                post = cursor.fetchone()

                query = """
                    SELECT COUNT(*)
                    FROM information_historique
                    WHERE id_info = %s
                """
                cursor.execute(query,(post['id'],))
                count = cursor.fetchone()
                if count['COUNT(*)']>=1:
                    print("post déjà lu")

        print(count)

        cursor.execute(
            "INSERT INTO information_historique (id_user, id_info) VALUES (%s, %s)",
            (id_user, post['id'])
        )
        connection.commit()

        if not post:
            return jsonify({"error": "Aucun post trouvé"}), 404

        # Formatage de la date
        post['created_at'] = post['created_at'].strftime('%Y-%m-%d %H:%M:%S')

        # Vérifie si le post est déjà en favori pour l'utilisateur
        if id_user:
            fav_query = """
                SELECT 1 FROM information_favori
                WHERE id_user = %s AND id_info = %s
                LIMIT 1
            """
            cursor.execute(fav_query, (id_user, post['id']))
            post['is_favorite'] = cursor.fetchone() is not None
        else:
            post['is_favorite'] = False

        return jsonify(post), 200

    except Exception as e:
        print(f"Erreur : {str(e)}")
        return jsonify({
            "error": "Une erreur est survenue",
            "details": str(e)
        }), 500
