from flask import send_from_directory, Blueprint

get_files_bp = Blueprint('files', __name__)


@get_files_bp.route('/files/<path:filename>')
def get_files(filename):

    return send_from_directory('public_files', filename)