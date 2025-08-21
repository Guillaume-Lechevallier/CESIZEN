# Dockerisation de CESIZEN

## Développement
```bash
docker compose -f docker-compose.dev.yml up --build
```
- Front accessible sur http://localhost:4200
- API accessible sur http://localhost:5000
- Volume monté sur `Back/` pour le hot-reload

## Production
```bash
docker compose -f docker-compose.prod.yml up -d --build
```
- Front servi par NGINX
- Back exécuté via Gunicorn
- Réseau public pour le front, privé pour back/db
- Le back n'expose pas de port à l'hôte

## Variables d'environnement
Copiez `.env.example` vers `.env` et renseignez les valeurs.

## Bonnes pratiques
- Pour réinitialiser la base : supprimer le volume `db_data`
- Ne pas renommer les dossiers `Front` ou `Back`
