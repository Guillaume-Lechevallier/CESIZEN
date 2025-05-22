# CESIZEN - Application de Suivi Émotionnel et de Bien-être

## Table des matières
1. [Introduction](#introduction)
2. [Architecture Technique](#architecture-technique)
3. [Prérequis](#prérequis)
4. [Installation](#installation)
5. [Configuration](#configuration)
6. [Structure du Projet](#structure-du-projet)
7. [Fonctionnalités](#fonctionnalités)
8. [Composants](#composants)
9. [Services](#services)
10. [Sécurité](#sécurité)
11. [Tests](#tests)
12. [Déploiement](#déploiement)
13. [Maintenance](#maintenance)
14. [Contribution](#contribution)
15. [Licence](#licence)
16. [Contact](#contact)

## Introduction

CESIZEN est une application web moderne développée avec Angular, conçue pour aider les utilisateurs à suivre et gérer leur bien-être émotionnel. L'application offre une interface intuitive et des fonctionnalités avancées pour le suivi des émotions, la gestion du stress, et l'amélioration du bien-être mental.

### Objectifs du Projet
- Fournir une plateforme accessible pour le suivi émotionnel
- Offrir des outils pratiques pour la gestion du stress
- Permettre aux utilisateurs de suivre leur progression
- Créer une communauté de soutien
- Assurer la confidentialité et la sécurité des données

### Public Cible
- Particuliers souhaitant améliorer leur bien-être mental
- Professionnels de la santé mentale
- Organisations soucieuses du bien-être de leurs employés
- Étudiants et chercheurs en psychologie

## Architecture Technique

### Stack Technologique
- **Frontend**: Angular 18.2.0
- **UI Framework**: Angular Material 18.2.7
- **CSS Framework**: Bootstrap 5.3.3
- **Charts**: Chart.js 4.4.9
- **State Management**: RxJS 7.8.0
- **PWA Support**: @angular/pwa 19.0.4
- **Testing**: Jasmine & Karma
- **Build Tools**: Angular CLI 18.2.7

### Architecture Globale
L'application suit une architecture modulaire basée sur les composants Angular, avec une séparation claire des responsabilités :
- Composants UI
- Services
- Guards
- Intercepteurs
- Modules
- Routes

### Patterns de Conception
- Singleton (Services)
- Observer (RxJS)
- Component-Based Architecture
- Dependency Injection
- Lazy Loading
- Reactive Forms

## Prérequis

### Système
- Node.js (version 18.x ou supérieure)
- npm (version 9.x ou supérieure)
- Git
- Navigateur web moderne (Chrome, Firefox, Safari, Edge)

### Outils de Développement
- IDE recommandé : Visual Studio Code
- Extensions VS Code recommandées :
  - Angular Language Service
  - ESLint
  - Prettier
  - GitLens
  - Chrome Debugger

### Configuration Système
- Au moins 4GB de RAM
- 2GB d'espace disque libre
- Connexion Internet stable
- Résolution d'écran minimale : 1280x720

## Installation

### Cloner le Repository
```bash
git clone [URL_DU_REPO]
cd CESIZEN
```

### Installation des Dépendances
```bash
npm install
```

### Vérification de l'Installation
```bash
ng version
npm run start
```

### Résolution des Problèmes Courants
1. **Erreur de version Node.js**
   ```bash
   nvm install 18
   nvm use 18
   ```

2. **Conflits de dépendances**
   ```bash
   npm cache clean --force
   rm -rf node_modules
   npm install
   ```

3. **Erreurs de compilation TypeScript**
   ```bash
   npm run build -- --verbose
   ```

## Configuration

### Variables d'Environnement
Créez un fichier `.env` à la racine du projet :
```env
API_URL=http://localhost:3000
ENVIRONMENT=development
DEBUG_MODE=true
```

### Configuration Angular
Le fichier `angular.json` contient les configurations principales :
- Styles globaux
- Assets
- Build options
- Serve options
- Test configuration

### Configuration TypeScript
Le fichier `tsconfig.json` définit :
- Compiler options
- Path mappings
- Type definitions
- Module resolution

### Configuration du Service Worker
Le fichier `ngsw-config.json` gère :
- Cache strategies
- Asset groups
- Data groups
- Navigation URLs

## Structure du Projet

### Organisation des Dossiers
```
CESIZEN/
├── src/
│   ├── app/
│   │   ├── components/
│   │   ├── services/
│   │   ├── guards/
│   │   ├── models/
│   │   ├── utils/
│   │   └── shared/
│   ├── assets/
│   ├── environments/
│   └── styles/
├── e2e/
├── docs/
└── dist/
```

### Description des Dossiers Principaux

#### src/app/components/
Contient tous les composants Angular :
- `accueil/` : Page d'accueil
- `dashboard/` : Tableau de bord principal
- `questionnaire/` : Gestion des questionnaires
- `signaler-un-probleme/` : Formulaire de signalement
- `createaccount/` : Création de compte
- `loginpage/` : Page de connexion
- Et plus...

#### src/app/services/
Services Angular pour :
- Authentification
- Gestion des données
- Communication API
- Gestion d'état
- Notifications

#### src/app/guards/
Guards de routage pour :
- Protection des routes
- Vérification d'authentification
- Gestion des permissions

#### src/app/models/
Interfaces et types TypeScript :
- User
- Emotion
- Questionnaire
- Response
- Settings

#### src/app/utils/
Fonctions utilitaires :
- Helpers
- Constants
- Validators
- Formatters

#### src/app/shared/
Composants partagés :
- Header
- Footer
- Loading
- Error
- Modals

## Fonctionnalités

### 1. Gestion des Comptes Utilisateurs
- Inscription
- Connexion
- Réinitialisation de mot de passe
- Gestion du profil
- Paramètres de confidentialité

### 2. Tableau de Bord
- Vue d'ensemble des émotions
- Statistiques personnelles
- Graphiques d'évolution
- Rappels et notifications
- Favoris

### 3. Suivi Émotionnel
- Journal des émotions
- Échelle d'intensité
- Catégorisation
- Tags personnalisés
- Notes et commentaires

### 4. Questionnaires
- Questionnaires personnalisés
- Suivi des réponses
- Analyse des résultats
- Recommandations
- Export de données

### 5. Outils de Bien-être
- Exercices de respiration
- Techniques de relaxation
- Conseils personnalisés
- Ressources éducatives
- Rappels de bien-être

### 6. Signalement de Problèmes
- Formulaire de contact
- Rapport de bug
- Suggestions d'amélioration
- Support technique
- FAQ

## Composants

### Composants Principaux

#### Accueil (accueil/)
- Carrousel de présentation
- Appel à l'action
- Témoignages
- Statistiques
- Navigation rapide

#### Dashboard (dashboard/)
- Widgets personnalisables
- Graphiques interactifs
- Filtres avancés
- Export de données
- Vue calendrier

#### Questionnaire (questionnaire/)
- Formulaires dynamiques
- Validation en temps réel
- Sauvegarde automatique
- Historique des réponses
- Analyse des tendances

#### Signaler un Problème (signaler-un-probleme/)
- Formulaire multi-étapes
- Upload de captures d'écran
- Catégorisation des problèmes
- Suivi du statut
- Communication avec le support

### Composants Partagés

#### Header (toolbar/)
- Navigation principale
- Menu utilisateur
- Recherche globale
- Notifications
- Thème sombre/clair

#### Footer (footer/)
- Liens utiles
- Informations légales
- Réseaux sociaux
- Newsletter
- Contact

#### Modals
- Confirmation
- Information
- Formulaire
- Galerie
- Aperçu

## Services

### Services Principaux

#### AuthService
- Gestion de l'authentification
- Tokens JWT
- Refresh token
- Gestion des sessions
- Permissions

#### UserService
- CRUD utilisateur
- Gestion du profil
- Préférences
- Paramètres
- Historique

#### EmotionService
- Enregistrement des émotions
- Analyse des données
- Statistiques
- Recommandations
- Export

#### QuestionnaireService
- Gestion des questionnaires
- Réponses
- Analyse
- Rapports
- Personnalisation

#### NotificationService
- Notifications push
- Emails
- Rappels
- Alertes
- Messages système

### Services Utilitaires

#### LoggerService
- Logging
- Debug
- Erreurs
- Performance
- Analytics

#### StorageService
- Local storage
- Session storage
- Cache
- IndexedDB
- Cookies

#### ApiService
- Requêtes HTTP
- Intercepteurs
- Gestion des erreurs
- Cache
- Retry logic

## Sécurité

### Authentification
- JWT
- OAuth 2.0
- 2FA
- Session management
- Password policies

### Autorisation
- RBAC
- Permissions
- Guards
- Intercepteurs
- Audit logs

### Protection des Données
- Chiffrement
- Sanitization
- Validation
- CSRF
- XSS

### Conformité
- RGPD
- CCPA
- HIPAA
- ISO 27001
- OWASP

## Tests

### Tests Unitaires
- Jasmine
- Karma
- Coverage
- Mocks
- Spies

### Tests E2E
- Protractor
- Scénarios
- Données de test
- Rapports
- CI/CD

### Tests de Performance
- Lighthouse
- WebPageTest
- Chrome DevTools
- Monitoring
- Optimisation

## Déploiement

### Environnements
- Development
- Staging
- Production
- Testing
- Demo

### Processus de Build
```bash
npm run build --prod
```

### Configuration Serveur
- Nginx
- Apache
- Node.js
- PM2
- Docker

### CI/CD
- GitHub Actions
- Jenkins
- Travis CI
- CircleCI
- GitLab CI

## Maintenance

### Monitoring
- Logs
- Métriques
- Alertes
- Performance
- Disponibilité

### Mises à Jour
- Versions
- Dependencies
- Security patches
- Features
- Bug fixes

### Backup
- Base de données
- Fichiers
- Configuration
- Logs
- Users

## Contribution

### Guidelines
- Code style
- Commits
- PR
- Reviews
- Documentation

### Workflow
1. Fork
2. Branch
3. Commit
4. PR
5. Review
6. Merge

### Documentation
- Code
- API
- Architecture
- Deployment
- Troubleshooting

## Licence

Ce projet est sous licence [LICENSE_TYPE]. Voir le fichier `LICENSE` pour plus de détails.

## Contact

### Support
- Email: [SUPPORT_EMAIL]
- Phone: [SUPPORT_PHONE]
- Hours: [SUPPORT_HOURS]

### Équipe
- Product Owner: [PO_NAME]
- Tech Lead: [TL_NAME]
- Developers: [DEV_NAMES]
- Designers: [DESIGNER_NAMES]

### Réseaux Sociaux
- Twitter: [TWITTER_HANDLE]
- LinkedIn: [LINKEDIN_URL]
- GitHub: [GITHUB_URL]
- Facebook: [FACEBOOK_URL]

---

*Ce README est un document vivant et sera mis à jour régulièrement pour refléter l'état actuel du projet.*
