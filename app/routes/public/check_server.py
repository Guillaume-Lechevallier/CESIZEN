from flask import send_from_directory, Blueprint, jsonify

check_server_bp = Blueprint('check_server', __name__)

@check_server_bp.route('/check_server', methods=['GET'])
def check_server():
    return jsonify("True")