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

## Introduction

CESIZEN est une application complète de bien-être mental qui offre plusieurs fonctionnalités pour aider les utilisateurs à gérer leur santé mentale. L'application comprend un système de suivi des émotions, des questionnaires d'évaluation, des exercices de respiration, et un système d'information sur la santé mentale.

## Architecture

L'application est construite avec :
- Backend : Flask (Python)
- Base de données : MySQL
- API RESTful
- Architecture modulaire avec blueprints Flask

Structure des dossiers :
```
CESIZEN/
├── api/
│   ├── config/
│   ├── routes/
│   │   ├── auth/
│   │   ├── users/
│   │   ├── content/
│   │   └── public/
│   └── utils/
├── public_files/
└── app.py
```

## Installation

1. Cloner le repository
2. Installer les dépendances Python :
```bash
pip install -r requirements.txt
```
3. Configurer la base de données MySQL
4. Configurer les variables d'environnement

## Configuration

L'application nécessite la configuration suivante :
- Base de données MySQL
- Variables d'environnement pour les connexions DB
- Configuration CORS pour l'accès API

## API Endpoints

### Authentification

#### Authentification par Mot de Passe
- **Endpoint**: `/auth/auth_by_password`
- **Méthode**: GET
- **Headers requis**: 
  - `email`: Email de l'utilisateur
  - `password`: Mot de passe
- **Réponse**: 
  - Succès (200): `{"auth": true, "token": "token_value"}`
  - Échec (400): `{"error": "Email ou mot de passe manquant"}`
  - Échec (401): `{"auth": false, "error": "Email ou mot de passe incorrect"}`

#### Authentification par Token
- **Endpoint**: `/auth/auth_by_token`
- **Méthode**: GET
- **Headers requis**: 
  - `token`: Token d'authentification
- **Réponse**: 
  - Succès (200): `true`
  - Échec (400): `{"error": "token manquant"}`

### Gestion des Utilisateurs

#### Création d'Utilisateur
- **Endpoint**: `/user/create_users`
- **Méthode**: POST
- **Body JSON requis**:
  ```json
  {
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "dob": "date",
    "sex": "string",
    "password": "string"
  }
  ```
- **Réponse**:
  - Succès (201): `{"success": true, "message": "Utilisateur créé avec succès"}`
  - Échec (400): `{"success": false, "message": "Tous les champs sont requis"}`
  - Échec (409): `{"success": false, "message": "Email déjà utilisé"}`

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

L'application utilise une base de données MySQL avec les tables suivantes :
- `users`: Informations des utilisateurs
- `authentification_token`: Tokens d'authentification
- `user_emotion`: Historique des émotions
- `tracker_emotion_list`: Liste des émotions disponibles
- `questionnaire`: Questions et points
- `reponses_user`: Réponses aux questionnaires
- `informations_liste`: Contenu informatif
- `information_favori`: Favoris des utilisateurs
- `information_historique`: Historique de lecture
- `exercice_respiration`: Exercices de respiration

## Sécurité

- Authentification par token
- Mots de passe hashés avec bcrypt
- Validation des entrées
- Protection CORS
- Gestion des sessions
- Désactivation sécurisée des comptes

## Déploiement

1. Préparer l'environnement de production
2. Configurer le serveur web (ex: Apache)
3. Configurer le serveur WSGI (ex: Gunicorn)
4. Mettre en place les variables d'environnement
5. Configurer la base de données de production
6. Déployer les fichiers statiques
7. Lancer l'application

## Maintenance

- Nettoyage régulier des tokens expirés
- Suppression des comptes inactifs après 30 jours
- Sauvegarde régulière de la base de données
- Monitoring des performances
- Mise à jour des dépendances

## Support

Pour toute question ou problème, veuillez contacter l'équipe de support. 
