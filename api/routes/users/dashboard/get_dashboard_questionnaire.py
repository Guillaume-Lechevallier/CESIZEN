import bcrypt
from flask import request, jsonify, Blueprint, json
from api.utils.db import get_db_connection
from api.utils.get_id_by_token import get_id_by_token

get_dashboard_questionnaire_bp = Blueprint('get_dashboard_questionnaire', __name__)


@get_dashboard_questionnaire_bp.route('/user/get_dashboard_questionnaire', methods=['GET'])
def get_dashboard_questionnaire():

    try:
        token = request.headers.get('Token')
        if not token:
            return jsonify({"error": "Token manquant"}), 401

        user_id = get_id_by_token(token)

        connection = get_db_connection()
        ##avoir le dashboard du questionnaire##

        cursor = connection.cursor(dictionary=True)

        query = f"SELECT date_reponse,score FROM reponses_user WHERE id_user = %s ORDER BY date_reponse ASC LIMIT 5"
        cursor.execute(query, (user_id,))

        resultatquestionnaire = cursor.fetchall()
        print(resultatquestionnaire)









        connection.commit()












        return jsonify({"resultatquestionnaire":resultatquestionnaire}),200
    except Exception as e:
        print(f"🔥 Erreur : {e}")
        return jsonify({"error": "Une erreur est survenue", "details": str(e)})

    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()
