from flask import Flask
from flask_cors import CORS
from app.routes.auth import auth_by_token, auth_by_password
from app.routes.users import create_users, disconnect_and_desactivate_account, get_user_data
from app.routes.users.dashboard import get_dashboard_questionnaire,get_dashboard_tracker
from app.routes.content.information import get_information,get_one_information,get_all_favorite_info,act_on_favorite
from app.routes.content.questionnaire import get_questions, submit_response
from app.routes.content.breathing_exercices import get_breathing_exercises
from app.routes.content.tracker import get_emotion_list,post_emotion
from app.routes.public import get_file,hello,check_server


app = Flask(__name__)
CORS(app)

# Enregistrement des blueprints
app.register_blueprint(auth_by_token.auth_by_token_bp)
app.register_blueprint(auth_by_password.auth_by_password_bp)
app.register_blueprint(create_users.create_users_bp)
app.register_blueprint(disconnect_and_desactivate_account.disconnect_and_desactivate_account_bp)
app.register_blueprint(get_user_data.get_user_data_bp)
app.register_blueprint(get_information.get_information_bp)
app.register_blueprint(get_one_information.get_one_information_bp)
app.register_blueprint(get_all_favorite_info.get_all_favorite_info_bp)
app.register_blueprint(act_on_favorite.set_favorite_bp)
app.register_blueprint(get_questions.get_questions_bp)
app.register_blueprint(submit_response.submit_response_bp)
app.register_blueprint(get_breathing_exercises.get_breathing_exercises_bp)
app.register_blueprint(get_file.get_files_bp)
app.register_blueprint(hello.hello_bp)
app.register_blueprint(check_server.check_server_bp)
app.register_blueprint(get_dashboard_questionnaire.get_dashboard_questionnaire_bp)
app.register_blueprint(get_dashboard_tracker.get_dashboard_tracker_bp)
app.register_blueprint(get_emotion_list.get_emotion_list_bp)
app.register_blueprint(post_emotion.post_emotion_bp)


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=5000, threaded=True)
