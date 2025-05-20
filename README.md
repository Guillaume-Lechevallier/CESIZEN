# CESIZEN - Application de Bien-être Mental

## Table des matières
1. [Introduction](#introduction)
2. [Architecture](#architecture)
3. [Installation](#installation)
4. [Configuration](#configuration)
5. [API Endpoints](#api-endpoints)
   - [Authentification](#authentification)
   - [Gestion des Utilisateurs](#gestion-des-utilisateurs)
   - [Contenu](#contenu)
   - [Tracker d'Émotions](#tracker-démotions)
   - [Questionnaire](#questionnaire)
   - [Exercices de Respiration](#exercices-de-respiration)
   - [Fichiers Publics](#fichiers-publics)
6. [Base de Données](#base-de-données)
7. [Sécurité](#sécurité)
8. [Déploiement](#déploiement)
9. [Exemples d'Utilisation](#exemples-dutilisation)
10. [Gestion des Erreurs](#gestion-des-erreurs)
11. [Bonnes Pratiques](#bonnes-pratiques)
12. [Maintenance](#maintenance)
13. [FAQ](#faq)
14. [Support](#support)

## Introduction

CESIZEN est une application complète de bien-être mental qui offre plusieurs fonctionnalités pour aider les utilisateurs à gérer leur santé mentale. L'application comprend un système de suivi des émotions, des questionnaires d'évaluation, des exercices de respiration, et un système d'information sur la santé mentale.

### Objectifs de l'Application
- Fournir un outil de suivi quotidien des émotions
- Offrir des ressources éducatives sur la santé mentale
- Permettre l'évaluation régulière de l'état mental
- Proposer des exercices de respiration pour la gestion du stress
- Créer un espace personnel sécurisé pour chaque utilisateur

### Fonctionnalités Principales
1. **Système d'Authentification**
   - Inscription sécurisée
   - Connexion par email/mot de passe
   - Authentification par token
   - Gestion des sessions

2. **Tracker d'Émotions**
   - Enregistrement quotidien des émotions
   - Suivi des tendances émotionnelles
   - Visualisation des données
   - Historique personnalisé

3. **Questionnaire d'Évaluation**
   - Questions adaptatives
   - Calcul de scores
   - Suivi des progrès
   - Recommandations personnalisées

4. **Exercices de Respiration**
   - Exercices guidés
   - Durée personnalisable
   - Suivi des sessions
   - Recommandations basées sur l'état émotionnel

5. **Système d'Information**
   - Articles éducatifs
   - Gestion des favoris
   - Historique de lecture
   - Contenu personnalisé

## Architecture

### Stack Technologique
- **Backend**: Flask (Python 3.8+)
- **Base de données**: MySQL 8.0+
- **API**: RESTful
- **Architecture**: Modulaire avec blueprints Flask
- **Sécurité**: JWT, bcrypt, CORS
- **Serveur**: Gunicorn (production)
- **Proxy**: Nginx (production)

### Structure des Dossiers
```
CESIZEN/
├── api/
│   ├── config/
│   │   ├── __init__.py
│   │   ├── database.py
│   │   └── security.py
│   ├── routes/
│   │   ├── auth/
│   │   │   ├── __init__.py
│   │   │   ├── auth_by_password.py
│   │   │   └── auth_by_token.py
│   │   ├── users/
│   │   │   ├── __init__.py
│   │   │   ├── create_users.py
│   │   │   ├── get_user_data.py
│   │   │   └── disconnect_and_desactivate_account.py
│   │   ├── content/
│   │   │   ├── __init__.py
│   │   │   ├── information/
│   │   │   ├── questionnaire/
│   │   │   ├── tracker/
│   │   │   └── breathing_exercices/
│   │   └── public/
│   │       ├── __init__.py
│   │       ├── hello.py
│   │       └── get_file.py
│   └── utils/
│       ├── __init__.py
│       ├── db.py
│       ├── security.py
│       └── email.py
├── public_files/
│   ├── images/
│   └── documents/
├── tests/
│   ├── __init__.py
│   ├── test_auth.py
│   ├── test_users.py
│   └── test_content.py
├── requirements.txt
├── app.py
└── README.md
```

### Composants Principaux

#### Backend (Flask)
- **Blueprints**: Organisation modulaire des routes
- **Middleware**: Gestion des CORS, authentification
- **Utils**: Fonctions utilitaires réutilisables
- **Config**: Configuration de l'application

#### Base de Données
- **MySQL**: Stockage relationnel
- **Connexions**: Pool de connexions
- **Migrations**: Gestion des versions de schéma
- **Backup**: Système de sauvegarde automatique

#### Sécurité
- **Authentification**: JWT, bcrypt
- **Validation**: Sanitization des entrées
- **CORS**: Configuration des origines autorisées
- **Rate Limiting**: Protection contre les abus

## Installation

### Prérequis
- Python 3.8 ou supérieur
- MySQL 8.0 ou supérieur
- pip (gestionnaire de paquets Python)
- git (contrôle de version)

### Étapes d'Installation

1. **Cloner le Repository**
```bash
git clone https://github.com/votre-org/cesizen.git
cd cesizen
```

2. **Créer un Environnement Virtuel**
```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows
```

3. **Installer les Dépendances**
```bash
pip install -r requirements.txt
```

4. **Configuration de la Base de Données**
```sql
CREATE DATABASE cesizen CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'cesizen_user'@'localhost' IDENTIFIED BY 'votre_mot_de_passe';
GRANT ALL PRIVILEGES ON cesizen.* TO 'cesizen_user'@'localhost';
FLUSH PRIVILEGES;
```

5. **Variables d'Environnement**
Créer un fichier `.env` à la racine du projet :
```env
DB_HOST=localhost
DB_USER=cesizen_user
DB_PASSWORD=votre_mot_de_passe
DB_NAME=cesizen
SECRET_KEY=votre_clé_secrète
MAIL_SERVER=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=votre_email@gmail.com
MAIL_PASSWORD=votre_mot_de_passe_email
```

6. **Initialisation de la Base de Données**
```bash
python scripts/init_db.py
```

7. **Lancer l'Application en Mode Développement**
```bash
flask run --debug
```

### Vérification de l'Installation

1. **Tester l'API**
```bash
curl http://localhost:5000/
# Devrait retourner : "Bienvenu sur l'API de CESIZEN !"
```

2. **Vérifier la Base de Données**
```bash
python scripts/check_db.py
```

3. **Lancer les Tests**
```bash
pytest
```

## Configuration

### Configuration de la Base de Données

#### Paramètres de Connexion
```python
# api/config/database.py
DB_CONFIG = {
    'host': os.getenv('DB_HOST', 'localhost'),
    'user': os.getenv('DB_USER', 'cesizen_user'),
    'password': os.getenv('DB_PASSWORD', ''),
    'database': os.getenv('DB_NAME', 'cesizen'),
    'port': int(os.getenv('DB_PORT', 3306)),
    'charset': 'utf8mb4',
    'collation': 'utf8mb4_unicode_ci',
    'autocommit': True,
    'pool_size': 5,
    'pool_name': 'cesizen_pool'
}
```

#### Pool de Connexions
```python
# api/utils/db.py
from mysql.connector import pooling

connection_pool = pooling.MySQLConnectionPool(
    pool_name=DB_CONFIG['pool_name'],
    pool_size=DB_CONFIG['pool_size'],
    **DB_CONFIG
)
```

### Configuration CORS

```python
# app.py
from flask_cors import CORS

CORS(app, resources={
    r"/*": {
        "origins": [
            "http://localhost:3000",
            "https://votre-domaine.com"
        ],
        "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
        "allow_headers": ["Content-Type", "Authorization", "token"]
    }
})
```

### Configuration de la Sécurité

#### JWT Configuration
```python
# api/config/security.py
JWT_CONFIG = {
    'secret_key': os.getenv('SECRET_KEY'),
    'algorithm': 'HS256',
    'access_token_expires': timedelta(hours=1),
    'refresh_token_expires': timedelta(days=30)
}
```

#### Rate Limiting
```python
# app.py
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address

limiter = Limiter(
    app,
    key_func=get_remote_address,
    default_limits=["200 per day", "50 per hour"]
)
```

## API Endpoints

### Authentification

#### Authentification par Mot de Passe
- **Endpoint**: `/auth/auth_by_password`
- **Méthode**: GET
- **Headers requis**: 
  - `email`: Email de l'utilisateur
  - `password`: Mot de passe
- **Réponse**: 
  - Succès (200): 
    ```json
    {
        "auth": true,
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
        "user": {
            "id": 123,
            "email": "user@example.com",
            "firstname": "John",
            "lastname": "Doe"
        }
    }
    ```
  - Échec (400): 
    ```json
    {
        "error": "Email ou mot de passe manquant",
        "details": "Les champs email et password sont requis dans les headers"
    }
    ```
  - Échec (401): 
    ```json
    {
        "auth": false,
        "error": "Email ou mot de passe incorrect",
        "details": "Les identifiants fournis ne correspondent à aucun compte"
    }
    ```

#### Authentification par Token
- **Endpoint**: `/auth/auth_by_token`
- **Méthode**: GET
- **Headers requis**: 
  - `token`: Token d'authentification
- **Réponse**: 
  - Succès (200): 
    ```json
    {
        "auth": true,
        "user": {
            "id": 123,
            "email": "user@example.com"
        }
    }
    ```
  - Échec (400): 
    ```json
    {
        "error": "token manquant",
        "details": "Le token d'authentification est requis dans les headers"
    }
    ```
  - Échec (401): 
    ```json
    {
        "auth": false,
        "error": "token invalide",
        "details": "Le token fourni n'est pas valide ou a expiré"
    }
    ```

### Gestion des Utilisateurs

#### Création d'Utilisateur
- **Endpoint**: `/user/create_users`
- **Méthode**: POST
- **Headers requis**:
  - `Content-Type: application/json`
- **Body JSON requis**:
  ```json
  {
    "firstName": "John",
    "lastName": "Doe",
    "email": "john.doe@example.com",
    "dob": "1990-01-01",
    "sex": "M",
    "password": "MotDePasse123!",
    "taille": 180,
    "poids": 75
  }
  ```
- **Validation**:
  - Email: Format valide, unique
  - Mot de passe: Min 8 caractères, 1 majuscule, 1 chiffre, 1 caractère spécial
  - Date de naissance: Format YYYY-MM-DD, âge minimum 13 ans
  - Sexe: 'M' ou 'F'
  - Taille: Entre 100 et 250 cm
  - Poids: Entre 30 et 200 kg

- **Réponse**:
  - Succès (201): 
    ```json
    {
        "success": true,
        "message": "Utilisateur créé avec succès",
        "user": {
            "id": 123,
            "email": "john.doe@example.com",
            "firstName": "John",
            "lastName": "Doe"
        }
    }
    ```
  - Échec (400): 
    ```json
    {
        "success": false,
        "message": "Données invalides",
        "errors": {
            "email": "Format d'email invalide",
            "password": "Le mot de passe doit contenir au moins 8 caractères"
        }
    }
    ```
  - Échec (409): 
    ```json
    {
        "success": false,
        "message": "Email déjà utilisé",
        "details": "Un compte existe déjà avec cette adresse email"
    }
    ```

#### Récupération des Données Utilisateur
- **Endpoint**: `/user/get_user_data`
- **Méthode**: GET
- **Headers requis**: 
  - `token`: Token d'authentification
- **Réponse**:
  - Succès (200): Données utilisateur (nom, prénom, date de naissance, email, taille, poids)
  - Échec (400): `{"error": "Token manquant"}`
  - Échec (404): `{"error": "Utilisateur non trouvé"}`

#### Déconnexion et Désactivation de Compte
- **Endpoint**: `/user/disconnect_and_desactivate_account`
- **Méthode**: GET
- **Headers requis**:
  - `email`: Email de l'utilisateur
  - `password`: Mot de passe
  - `token`: Token d'authentification
- **Réponse**:
  - Succès (200): `{"auth": true, "message": "Compte désactivé avec succès", "date_suppression": "date"}`
  - Échec (400): `{"error": "Email, mot de passe ou token manquant"}`

### Contenu

#### Récupération d'Information
- **Endpoint**: `/content/information`
- **Méthode**: GET
- **Headers optionnels**: 
  - `token`: Token d'authentification
- **Réponse**:
  - Succès (200): Information aléatoire avec statut favori
  - Échec (404): `{"error": "Aucun post trouvé"}`

#### Récupération d'Information Spécifique
- **Endpoint**: `/content/one_information/<id>`
- **Méthode**: GET
- **Headers optionnels**: 
  - `token`: Token d'authentification
- **Réponse**:
  - Succès (200): Information spécifique avec statut favori
  - Échec (404): `{"error": "Post non trouvé"}`

#### Gestion des Favoris
- **Endpoint**: `/content/toggle_favorite/<id_info>`
- **Méthode**: POST
- **Headers requis**: 
  - `token`: Token d'authentification
- **Réponse**:
  - Succès (200): `{"is_favorite": true/false}`

#### Liste des Favoris
- **Endpoint**: `/content/favorite`
- **Méthode**: GET
- **Headers requis**: 
  - `token`: Token d'authentification
- **Réponse**:
  - Succès (200): Liste des informations favorites

### Tracker d'Émotions

#### Liste des Émotions
- **Endpoint**: `/content/get_emotion_list`
- **Méthode**: GET
- **Headers requis**: 
  - `token`: Token d'authentification
- **Réponse**:
  - Succès (200): Liste des émotions disponibles avec leurs sous-émotions

#### Enregistrement d'Émotion
- **Endpoint**: `/content/post_emotion`
- **Méthode**: POST
- **Headers requis**: 
  - `token`: Token d'authentification
- **Body JSON requis**:
  ```json
  {
    "emotion": "string",
    "sous_emotion": "string"
  }
  ```
- **Réponse**:
  - Succès (200): `{"message": "Émotion enregistrée"}`
  - Échec (409): `{"error": "Cette sous-émotion a déjà été enregistrée aujourd'hui"}`

#### Dashboard Tracker
- **Endpoint**: `/user/get_dashboard_tracker`
- **Méthode**: GET
- **Headers requis**: 
  - `token`: Token d'authentification
- **Réponse**:
  - Succès (200): Historique des émotions des 3 derniers mois avec liste des émotions

### Questionnaire

#### Récupération des Questions
- **Endpoint**: `/content/get_questions`
- **Méthode**: GET
- **Headers optionnels**: 
  - `token`: Token d'authentification
- **Réponse**:
  - Succès (200): Liste des questions du questionnaire

#### Soumission des Réponses
- **Endpoint**: `/content/submit_results`
- **Méthode**: GET
- **Headers requis**: 
  - `token`: Token d'authentification
- **Query Parameters**:
  - `data`: JSON stringifié des réponses
- **Réponse**:
  - Succès (200): Score total calculé

### Exercices de Respiration

#### Liste des Exercices
- **Endpoint**: `/content/breathing-exercises`
- **Méthode**: GET
- **Réponse**:
  - Succès (200): Liste des exercices de respiration disponibles

### Fichiers Publics

#### Accès aux Fichiers
- **Endpoint**: `/files/<filename>`
- **Méthode**: GET
- **Réponse**:
  - Succès (200): Fichier demandé
  - Échec (404): Fichier non trouvé

## Base de Données

### Schéma des Tables

#### Table `users`
```sql
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    sex ENUM('M', 'F') NOT NULL,
    taille INT,
    poids INT,
    actif BOOLEAN DEFAULT TRUE,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_suppression_compte DATETIME,
    date_modification DATETIME ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_actif (actif)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

#### Table `authentification_token`
```sql
CREATE TABLE authentification_token (
    id INT PRIMARY KEY,
    token VARCHAR(255) NOT NULL,
    type ENUM('web', 'mobile') NOT NULL,
    suppression_date DATETIME NOT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_token (token),
    INDEX idx_suppression (suppression_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

#### Table `user_emotion`
```sql
CREATE TABLE user_emotion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    emotion VARCHAR(50) NOT NULL,
    sous_emotion VARCHAR(50),
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user_emotion (user_id, emotion, sous_emotion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

#### Table `tracker_emotion_list`
```sql
CREATE TABLE tracker_emotion_list (
    id INT PRIMARY KEY AUTO_INCREMENT,
    emotion VARCHAR(50) NOT NULL,
    sous_emotion VARCHAR(50),
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_emotion_list (emotion, sous_emotion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

#### Table `questionnaire`
```sql
CREATE TABLE questionnaire (
    id INT PRIMARY KEY AUTO_INCREMENT,
    question TEXT NOT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_questionnaire (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

#### Table `reponses_user`
```sql
CREATE TABLE reponses_user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    questionnaire_id INT NOT NULL,
    reponse TEXT NOT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (questionnaire_id) REFERENCES questionnaire(id) ON DELETE CASCADE,
    INDEX idx_reponses_user (user_id, questionnaire_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

#### Table `informations_liste`
```sql
CREATE TABLE informations_liste (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(255) NOT NULL,
    contenu TEXT NOT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_informations_liste (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

#### Table `information_favori`
```sql
CREATE TABLE information_favori (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    information_id INT NOT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (information_id) REFERENCES informations_liste(id) ON DELETE CASCADE,
    INDEX idx_information_favori (user_id, information_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

#### Table `information_historique`
```sql
CREATE TABLE information_historique (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    information_id INT NOT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (information_id) REFERENCES informations_liste(id) ON DELETE CASCADE,
    INDEX idx_information_historique (user_id, information_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

#### Table `exercice_respiration`
```sql
CREATE TABLE exercice_respiration (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(255) NOT NULL,
    contenu TEXT NOT NULL,
    date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_exercice_respiration (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

## Sécurité

### Authentification

#### Génération de Token
```python
def generate_token(user_id: int) -> str:
    payload = {
        'user_id': user_id,
        'exp': datetime.utcnow() + timedelta(hours=1),
        'iat': datetime.utcnow()
    }
    return jwt.encode(payload, JWT_CONFIG['secret_key'], algorithm=JWT_CONFIG['algorithm'])
```

#### Validation de Token
```python
def validate_token(token: str) -> dict:
    try:
        payload = jwt.decode(
            token,
            JWT_CONFIG['secret_key'],
            algorithms=[JWT_CONFIG['algorithm']]
        )
        return payload
    except jwt.ExpiredSignatureError:
        raise AuthError("Token expiré")
    except jwt.InvalidTokenError:
        raise AuthError("Token invalide")
```

### Protection des Données

#### Hachage des Mots de Passe
```python
def hash_password(password: str) -> str:
    salt = bcrypt.gensalt()
    return bcrypt.hashpw(password.encode('utf-8'), salt).decode('utf-8')

def verify_password(password: str, hashed: str) -> bool:
    return bcrypt.checkpw(password.encode('utf-8'), hashed.encode('utf-8'))
```

#### Sanitization des Entrées
```python
def sanitize_input(data: str) -> str:
    # Suppression des caractères spéciaux
    data = re.sub(r'[<>]', '', data)
    # Échappement des caractères SQL
    return mysql.connector.conversion.MySQLConverter().escape(data)
```

## Déploiement

### Préparation de l'Environnement

1. **Configuration du Serveur**
```bash
# Installation des dépendances système
sudo apt update
sudo apt install python3.8 python3.8-venv nginx mysql-server

# Configuration de MySQL
sudo mysql_secure_installation

# Installation de Gunicorn
pip install gunicorn
```

2. **Configuration Nginx**
```nginx
server {
    listen 80;
    server_name api.cesizen.com;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location /static {
        alias /path/to/cesizen/public_files;
    }
}
```

3. **Service Systemd**
```ini
[Unit]
Description=CESIZEN API
After=network.target

[Service]
User=cesizen
Group=cesizen
WorkingDirectory=/path/to/cesizen
Environment="PATH=/path/to/cesizen/venv/bin"
ExecStart=/path/to/cesizen/venv/bin/gunicorn -w 4 -b 127.0.0.1:8000 app:app

[Install]
WantedBy=multi-user.target
```

### Procédure de Déploiement

1. **Préparation**
```bash
# Mise à jour du code
git pull origin main

# Mise à jour des dépendances
source venv/bin/activate
pip install -r requirements.txt

# Migration de la base de données
python scripts/migrate.py
```

2. **Tests**
```bash
# Tests unitaires
pytest

# Tests d'intégration
pytest tests/integration/

# Tests de charge
locust -f tests/load/locustfile.py
```

3. **Déploiement**
```bash
# Redémarrage du service
sudo systemctl restart cesizen

# Vérification des logs
sudo journalctl -u cesizen -f
```

## Maintenance

### Nettoyage Régulier

#### Script de Nettoyage des Tokens
```python
def cleanup_expired_tokens():
    with get_db_connection() as conn:
        cursor = conn.cursor()
        cursor.execute("""
            DELETE FROM authentification_token 
            WHERE suppression_date < NOW()
        """)
        conn.commit()
```

#### Script de Suppression des Comptes
```python
def cleanup_inactive_accounts():
    with get_db_connection() as conn:
        cursor = conn.cursor()
        cursor.execute("""
            UPDATE users 
            SET actif = 0 
            WHERE date_suppression_compte < NOW()
        """)
        conn.commit()
```

### Monitoring

#### Métriques à Surveiller
- Taux de réponse de l'API
- Temps de réponse moyen
- Utilisation de la base de données
- Espace disque
- Utilisation CPU/Mémoire
- Nombre d'utilisateurs actifs
- Taux d'erreur

#### Alertes
- Taux d'erreur > 1%
- Temps de réponse > 500ms
- Utilisation CPU > 80%
- Utilisation mémoire > 90%
- Espace disque < 10%

## FAQ

### Questions Générales

#### Comment créer un compte ?
1. Accédez à l'endpoint `/user/create_users`
2. Fournissez les informations requises
3. Vérifiez votre email
4. Connectez-vous avec vos identifiants

#### Comment réinitialiser mon mot de passe ?
1. Contactez le support
2. Fournissez votre email
3. Suivez les instructions reçues

#### Comment supprimer mon compte ?
1. Connectez-vous à votre compte
2. Accédez à `/user/disconnect_and_desactivate_account`
3. Confirmez la suppression

### Questions Techniques

#### Comment gérer les erreurs 404 ?
- Vérifiez l'URL complète (incluant le préfixe)
- Assurez-vous que le serveur est en cours d'exécution
- Vérifiez les logs pour plus de détails

#### Comment déboguer les problèmes d'authentification ?
1. Vérifiez le format du token
2. Assurez-vous que le token n'est pas expiré
3. Vérifiez les logs d'authentification

## Support

### Contact
- Email: support@cesizen.com
- Téléphone: +33 1 23 45 67 89
- Horaires: Lun-Ven, 9h-18h

### Documentation Supplémentaire
- [Guide d'API](https://api.cesizen.com/docs)
- [Guide de Déploiement](https://api.cesizen.com/deploy)
- [Guide de Sécurité](https://api.cesizen.com/security)

### Contribution
- [Guide de Contribution](https://github.com/votre-org/cesizen/CONTRIBUTING.md)
- [Code de Conduite](https://github.com/votre-org/cesizen/CODE_OF_CONDUCT.md)
- [Changelog](https://github.com/votre-org/cesizen/CHANGELOG.md) 
