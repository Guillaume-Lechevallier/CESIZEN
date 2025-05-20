from flask import jsonify, Blueprint, request
from datetime import datetime

from api.utils.db import get_db_connection
from api.utils.get_id_by_token import get_id_by_token
get_questions_bp = Blueprint('get_questions', __name__)

@get_questions_bp.route('/content/get_questions', methods=['GET'])
def get_questions():
    try:
        token = request.headers.get("token")
        if not token:
            connection = get_db_connection()
            cursor = connection.cursor(dictionary=True)

            query = "SELECT id, nom_question FROM questionnaire"
            cursor.execute(query)
            questions = cursor.fetchall()

            if not questions:
                return jsonify({"error": "Aucune question trouvée"}), 404

            return jsonify(questions), 200
        print(token)
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)

        id_user = get_id_by_token(token)
        query = """SELECT * FROM reponses_user WHERE id_user = %s AND date_reponse > DATE_SUB(CURDATE(), INTERVAL 1 
        YEAR) ORDER BY date_reponse DESC LIMIT 1;"""
        cursor.execute(query, (id_user,))
        lasttest = cursor.fetchone()

        query = """SELECT DATE_ADD(date_reponse, INTERVAL 1 YEAR) AS date_next_reponse FROM reponses_user WHERE 
        id_user = %s AND date_reponse > DATE_SUB(CURDATE(), INTERVAL 1 YEAR) ORDER BY date_reponse DESC LIMIT 1;"""
        cursor.execute(query, (id_user,))
        nextdate = cursor.fetchone()
        if lasttest :
            if lasttest['score'] >= 300:
                retour_html= ("<p><strong>Stress très élevé :</strong> Risque évalué entre 51% et 80%.</p><p>Si votre score de stress "
                              "vécus au cours des 24 derniers mois dépasse 300, vos risques de présenter dans un avenir "
                              "proche une maladie somatique sont très élevés.</p><p>Un score de 300 et plus suppose que "
                              "vous avez eu à traverser une série de situations particulièrement pénibles et éprouvantes. "
                              "Ne craignez donc pas de vous faire aider si c'est votre cas.</p>")
            elif 100 <= lasttest['score'] < 300:
                retour_html = ("<p><strong>Stress élevé :</strong> Risque évalué entre 31% et 50%.</p><p>Ces risques diminuent en "
                               "même temps que votre score total. Toutefois, si votre score est compris entre 300 et 100, "
                               "les risques qu'une maladie somatique se déclenche demeurent statistiquement "
                               "significatifs.</p><br><p>Prenez soin de vous. Ce n'est pas la peine d'en rajouter.</p>")
            else:
                retour_html= ("<p><strong>Stress modéré :</strong> Risque évalué à maximum 30%.</p><p>En dessous de 100, le risque "
                              "se révèle peu important. La somme des stress rencontrés est trop faible pour ouvrir la "
                              "voie à une maladie somatique.</p>")
            print(type(str(lasttest['score'])))
            nextdate = datetime.strptime(str(nextdate['date_next_reponse']), "%Y-%m-%d").strftime("%d/%m/%Y")
            retour_html = retour_html + "<p>Vous avez eu<strong> " + str(lasttest['score']) + " points</strong></p>"
            retour_html = retour_html + "<p>Vous pourrez repasser le test le : </p><h3>"+nextdate+"</h3>"




            if lasttest['score']:
                print("test déjà passé")
                return (jsonify({"score" : lasttest['score']},{"prochaine_date" : nextdate},{"retour_html" : retour_html})),200
        else:

            connection = get_db_connection()
            cursor = connection.cursor(dictionary=True)

            query = "SELECT id, nom_question FROM questionnaire"
            cursor.execute(query)
            questions = cursor.fetchall()

            if not questions:
                return jsonify({"error": "Aucune question trouvée"}), 404

            return jsonify(questions), 200

    except Exception as e:
        print(f"Erreur : {str(e)}")
        return jsonify({"error": "Une erreur est survenue", "details": str(e)}), 500


