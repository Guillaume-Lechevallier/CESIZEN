from flask import request, jsonify, json, Blueprint

from api.utils.db import get_db_connection
from api.utils.get_id_by_token import get_id_by_token

submit_response_bp = Blueprint('submit_results', __name__)


@submit_response_bp.route('/content/submit_results', methods=['GET'])
def submit_response():
    connection = None
    cursor = None
    try:
        token = request.headers.get('Token')
        if not token:
            return jsonify({"error": "Token manquant"}), 401

        user_id = get_id_by_token(token)

        if isinstance(user_id, tuple):
            user_id = user_id[0]
        user_id = int(user_id)

        data = request.args.get('data')
        if not data:
            return jsonify({"error": "Données manquantes"}), 400

        responses = json.loads(data)

        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        cursor.execute("SELECT id, points FROM questionnaire")
        question_points = {row["id"]: row["points"] for row in cursor.fetchall()}

        total_score = 0
        for response in responses:
            question_id = int(response['id'])
            user_response = int(response['response'])
            points = question_points.get(question_id, 0)
            total_score += points * user_response

        total_score = int(total_score)
        if total_score > 0:
            cursor.execute(
                "INSERT INTO reponses_user (score, date_reponse, id_user) VALUES (%s, NOW(), %s)",
                (total_score, user_id)
            )

            connection.commit()

            if total_score >= 300:
                retour_html = (
                    "<p><strong>Stress très élevé :</strong> Risque évalué entre 51% et 80%.</p><p>Si votre score de stress "
                    "vécus au cours des 24 derniers mois dépasse 300, vos risques de présenter dans un avenir "
                    "proche une maladie somatique sont très élevés.</p><p>Un score de 300 et plus suppose que "
                    "vous avez eu à traverser une série de situations particulièrement pénibles et éprouvantes. "
                    "Ne craignez donc pas de vous faire aider si c'est votre cas.</p>")
            elif 100 <= total_score < 300:
                retour_html = ("<p><strong>Stress élevé :</strong> Risque évalué entre 31% et 50%.</p><p>Ces risques diminuent en "
                               "même temps que votre score total. Toutefois, si votre score est compris entre 300 et 100, "
                               "les risques qu'une maladie somatique se déclenche demeurent statistiquement "
                               "significatifs.</p><br><p>Prenez soin de vous. Ce n'est pas la peine d'en rajouter.</p>")
            else:
                retour_html = (
                    "<p><strong>Stress modéré :</strong> Risque évalué à maximum 30%.</p><p>En dessous de 100, le risque "
                    "se révèle peu important. La somme des stress rencontrés est trop faible pour ouvrir la "
                    "voie à une maladie somatique.</p>")
            retour_html = retour_html + "<p>Vous avez eu<strong>" + str(total_score) + " points</strong></p>"
            return jsonify(retour_html), 200
        else:

            return jsonify(
                "<p><strong>Aucun stress :</strong> Vous avez l'air de mener une vie particulièrement paisible</p> "), 200

    except Exception as e:
        print(f"🔥 Erreur : {e}")
        return jsonify({"error": "Une erreur est survenue", "details": str(e)})

    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()
