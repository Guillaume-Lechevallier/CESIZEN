from flask import Blueprint, jsonify, request

from api.utils.admin.admin_get_id_by_token import admin_get_id_by_token
from api.utils.db import get_db_connection

dashboard_bp = Blueprint('dashboard', __name__)

@dashboard_bp.route('/dashboard', methods=['GET'])
def get_dashboard_data():
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

        # 📊 Utilisateurs - total, actifs/inactifs
        cursor.execute("SELECT COUNT(*) AS total FROM users")
        total_users = cursor.fetchone()["total"]

        cursor.execute("SELECT COUNT(*) AS actifs FROM users WHERE actif = 1")
        actifs = cursor.fetchone()["actifs"]

        inactifs = total_users - actifs

        cursor.execute("SELECT sex, COUNT(*) AS count FROM users GROUP BY sex")
        par_sexe = cursor.fetchall()

        # 📈 Émotions - globales
        cursor.execute("SELECT emotion, COUNT(*) AS count FROM user_emotion GROUP BY emotion ORDER BY count DESC")
        emotions_global = cursor.fetchall()

        # 📅 Émotions - par jour (7 derniers jours)
        cursor.execute("""
            SELECT created_date AS date, COUNT(*) AS count
            FROM user_emotion
            WHERE created_date >= CURDATE() - INTERVAL 7 DAY
            GROUP BY created_date
            ORDER BY created_date ASC
        """)
        emotions_par_jour = cursor.fetchall()

        # 🧪 Questionnaires - moyenne score
        cursor.execute("SELECT AVG(score) AS moyenne FROM reponses_user WHERE score IS NOT NULL")
        moyenne_score = cursor.fetchone()["moyenne"]

        # 📰 Informations - total et top favoris
        cursor.execute("SELECT COUNT(*) AS total FROM informations_liste")
        total_infos = cursor.fetchone()["total"]

        cursor.execute("""
            SELECT i.id, i.name, COUNT(f.id_user) AS favoris
            FROM information_favori f
            JOIN informations_liste i ON f.id_info = i.id
            GROUP BY i.id, i.name
            ORDER BY favoris DESC
            LIMIT 5
        """)
        favoris_top = cursor.fetchall()

        # 🌐 Connexions - par jour (7 derniers jours)
        cursor.execute("""
            SELECT DATE(dateconnexion) AS date, COUNT(*) AS count
            FROM historique_connexion
            WHERE dateconnexion >= CURDATE() - INTERVAL 7 DAY
            GROUP BY DATE(dateconnexion)
            ORDER BY date ASC
        """)
        connexions_par_jour = cursor.fetchall()

        cursor.close()
        conn.close()

        dashboard_data = {
            "users": {
                "total": total_users,
                "actifs": actifs,
                "inactifs": inactifs,
                "par_sexe": par_sexe
            },
            "emotions": {
                "global": emotions_global,
                "par_jour": emotions_par_jour
            },
            "questionnaires": {
                "moyenne_score": moyenne_score
            },
            "informations": {
                "total": total_infos,
                "favoris_top": favoris_top
            },
            "connexions": {
                "par_jour": connexions_par_jour
            }
        }

        return jsonify(dashboard_data), 200

    except Exception as e:
        print("Erreur dans /dashboard :", e)
        return jsonify({"error": str(e)}), 500
