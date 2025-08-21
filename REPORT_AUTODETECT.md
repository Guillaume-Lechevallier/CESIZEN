# Autodétection du projet CESIZEN

## Structure générale
- **Front** : application Angular située dans `Front/`
  - Commandes : `npm start` (développement), `npm run build` (production)
- **Back** : API Flask située dans `Back/`
  - Point d'entrée : `app.py`
  - Commande dev : `flask run` ou `python app.py`

## Configuration Back
- Fichiers lus :
  - `Back/api/config/config.py`
  - `Back/api/config/config_admin.py`
  - `Back/api/utils/db.py`
  - `Back/app.py`
- Variables environnement attendues :
  - `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASS`
  - `SECRET_KEY`
  - `EMAIL_FROM`, `SMTP_SERVER`, `SMTP_PORT`, `SMTP_LOGIN`, `SMTP_PASSWORD`
  - `CORS_ORIGINS`
- Port Flask : `5000`
- Sécurité : utilisation de `flask_cors`, `bcrypt`, gestion de tokens.

## Docker existant
Aucun `Dockerfile` ni fichier `docker-compose` détecté.

