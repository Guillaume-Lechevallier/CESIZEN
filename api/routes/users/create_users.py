import bcrypt
from flask import request, jsonify, Blueprint
from api.utils.db import get_db_connection

create_users_bp = Blueprint('create_users', __name__)

@create_users_bp.route('/user/create_users', methods=['POST'])
def create_users():
    data = request.get_json()

    # Récupération des champs du body JSON
    first_name = data.get('firstName')
    last_name = data.get('lastName')
    email = data.get('email')
    dob = data.get('dob')
    sex = data.get('sex')
    password = data.get('password')

    # Validation simple
    if not all([first_name, last_name, dob, sex, password,email]):
        return jsonify({"success": False, "message": "Tous les champs sont requis."}), 400

    # Hash du mot de passe
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

    connection = get_db_connection()
    cursor = connection.cursor()

    try:
        insert_query = """
            SELECT COUNT(*) FROM users
            WHERE email =  %s;
        """
        cursor.execute(insert_query, (email,))
        count = cursor.fetchone()[0]
        connection.commit()

        if count != 0:
            print("email déjà utilisé")
            return jsonify({"success": False, "message": "Email déjà utilisé"}),409

        insert_query = """
            INSERT INTO users (firstname, lastname, birth_date, sex, password,email)
            VALUES (%s, %s, %s, %s, %s,%s);
        """
        cursor.execute(insert_query, (first_name, last_name, dob, sex, hashed_password,email))
        connection.commit()

        return jsonify({"success": True, "message": "Utilisateur créé avec succès."}), 201

    except Exception as err:
        print("Erreur lors de l'insertion :", err)
        return jsonify({"success": False, "message": "Erreur serveur", "details": str(err)}), 500

    finally:
        cursor.close()
        connection.close()
