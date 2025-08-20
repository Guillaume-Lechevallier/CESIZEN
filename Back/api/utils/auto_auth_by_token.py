from datetime import datetime, timedelta
from api.utils.db import get_db_connection


def auto_auth_by_token(token):
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)

    query = "SELECT * FROM authentification_token WHERE token = %s"
    cursor.execute(query, (token,))
    user = cursor.fetchone()

    cursor.close()
    connection.close()

    if user:
        connection = get_db_connection()
        cursor = connection.cursor()

        new_suppression_date = datetime.now() + timedelta(hours=2)
        update_query = "UPDATE authentification_token SET suppression_date = %s WHERE token = %s"
        cursor.execute(update_query, (new_suppression_date, token))
        connection.commit()

        cursor.close()
        connection.close()

        return 200
    else:
        return 401