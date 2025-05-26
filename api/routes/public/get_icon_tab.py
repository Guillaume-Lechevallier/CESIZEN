from flask import Blueprint, request, send_file, jsonify
import requests
from bs4 import BeautifulSoup
from io import BytesIO
from urllib.parse import unquote, urlparse, urljoin

get_icon_tab_bp = Blueprint('get_icon_tab', __name__)

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0 Safari/537.36"
}

def get_favicon_url(website_url):
    try:
        response = requests.get(website_url, headers=HEADERS, timeout=5)
        soup = BeautifulSoup(response.text, 'html.parser')

        # Recherche des balises rel="icon" ou rel="shortcut icon"
        icon_link = soup.find("link", rel=lambda x: x and 'icon' in x.lower())
        if icon_link and icon_link.get("href"):
            href = icon_link["href"]
            favicon_url = urljoin(website_url, href)
            print(f"[DEBUG] Favicon trouvé dans le HTML : {favicon_url}")
            return favicon_url
    except Exception as e:
        print(f"[DEBUG] Erreur lors de la récupération du HTML : {e}")

    # Fallback vers /favicon.ico
    parsed = urlparse(website_url)
    fallback_url = f"{parsed.scheme}://{parsed.netloc}/favicon.ico"
    print(f"[DEBUG] Fallback Favicon URL : {fallback_url}")
    return fallback_url

@get_icon_tab_bp.route('/get_icon_tab/<path:site_url>', methods=['GET'])
def get_icon(site_url):
    try:
        # Décodage de l'URL encodée
        site_url = unquote(site_url)
        if not site_url.startswith('http'):
            site_url = 'http://' + site_url

        favicon_url = get_favicon_url(site_url)
        print(f"[DEBUG] URL finale du favicon : {favicon_url}")

        icon_response = requests.get(favicon_url, headers=HEADERS, timeout=5)

        if icon_response.status_code == 200 and icon_response.content:
            return send_file(BytesIO(icon_response.content), mimetype='image/x-icon')
        else:
            print(f"[DEBUG] Le favicon n’a pas pu être récupéré (status {icon_response.status_code})")
            return jsonify({'error': 'Favicon not found'}), 404

    except Exception as e:
        print(f"[ERROR] Exception dans /get_icon_tab : {e}")
        return jsonify({'error': str(e)}), 500
