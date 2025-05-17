from flask import jsonify, request, Blueprint
from app.utils.auto_auth_by_token import auto_auth_by_token

auth_by_token_bp = Blueprint('auth_by_token', __name__)

@auth_by_token_bp.route('/auth/auth_by_token', methods=['GET'])
def auth_by_token():
    token = request.headers.get('token')
    if not token:
        return jsonify({"error": "token manquant dans les headers."}), 400
    else:
        auth = auto_auth_by_token(token)
        if auth == 200:
            return jsonify(True), 200
        else:
            return jsonify(False), 200