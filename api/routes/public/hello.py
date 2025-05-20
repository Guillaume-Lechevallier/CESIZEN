from flask import send_from_directory, Blueprint

hello_bp = Blueprint('hello', __name__)


@hello_bp.route('/', methods=['GET'])
def hello():
    return "Bienvenu sur l'API de CESIZEN !"