from flask import jsonify, json, Blueprint

from app.utils.db import get_db_connection
get_breathing_exercises_bp = Blueprint('get_breathing_exercises', __name__)

@get_breathing_exercises_bp.route('/content/breathing-exercises', methods=['GET'])
def get_breathing_exercises():
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        cursor.execute("SELECT id, name, exercice FROM exercice_respiration")
        exercises = cursor.fetchall()

        cursor.close()
        conn.close()

        for exercise in exercises:
            exercise["exercice"] = json.loads(exercise["exercice"])

        return jsonify(exercises), 200

    except Exception as e:
        print("error : ", e)
        return jsonify({"error": str(e)}), 500