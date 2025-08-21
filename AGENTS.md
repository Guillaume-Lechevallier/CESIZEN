# Instructions pour les contributeurs

- Ne pas créer de nouveaux dossiers `Front` ou `Back` : utiliser ceux existants.
- Installer les dépendances Front avec `npm install --legacy-peer-deps`.
- Installer les dépendances Back via `pip install -r Back/requirements.txt`.
- Utiliser `docker compose` avec les fichiers fournis (`docker-compose.dev.yml`, `docker-compose.prod.yml`).
- Toujours exécuter les tests (`pytest`, `npm test`) avant de valider.
