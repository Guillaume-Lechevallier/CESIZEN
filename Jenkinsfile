pipeline {
  agent any

  environment {
    // ⚙️ REMPLACE par l’URL HTTPS de TON repo
    REPO_URL = 'https://github.com/<ton-user>/<ton-repo>.git'

    // Nom des images locales (si tu ne pushes pas sur DockerHub)
    APP_NAME = 'cesizen'
    GIT_SHA  = "${env.GIT_COMMIT ?: 'dev'}"
    DOCKER_TAG = "${env.GIT_COMMIT ?: 'latest'}"
  }

  // Le webhook GitHub déclenchera ce job
  triggers { githubPush() }

  options {
    ansiColor('xterm')
    buildDiscarder(logRotator(numToKeepStr: '20'))
    timestamps()
    disableConcurrentBuilds()
  }

  stages {

    stage('Checkout') {
      steps {
        // Clone via credentials GitHub (ID = "github")
        git branch: 'main',
            credentialsId: 'github',
            url: env.REPO_URL
      }
    }

    stage('Lint & Build Front (Angular 18)') {
      steps {
        script {
          // Utilise un conteneur Node pour ne rien installer dans Jenkins
          docker.image('node:20-alpine').inside {
            sh '''
              set -eux
              if [ -f Front/package.json ]; then
                cd Front
                npm ci || npm install
                npx eslint . || true
                # build prod
                npx ng version || true
                npx ng build --configuration production
              else
                echo "Front/package.json absent -> on saute la partie front."
              fi
            '''
          }
        }
      }
    }

    stage('Tests Back (Flask/Python)') {
      steps {
        script {
          docker.image('python:3.12-alpine').inside {
            sh '''
              set -eux
              if [ -f Back/requirements.txt ]; then
                apk add --no-cache gcc musl-dev libffi-dev
                python -m pip install --upgrade pip
                python -m pip install -r Back/requirements.txt pytest
                if [ -d Back/tests ]; then
                  cd Back
                  pytest --maxfail=1 --disable-warnings -q || true
                else
                  echo "Pas de dossier Back/tests -> skip tests."
                fi
              else
                echo "Back/requirements.txt absent -> skip back tests."
              fi
            '''
          }
        }
      }
    }

    stage('Build Docker images') {
      steps {
        sh '''
          set -eux
          # Construit à partir des Dockerfiles déjà présents dans tes dossiers existants
          docker build -t ${APP_NAME}-front:${DOCKER_TAG} -f Front/Dockerfile .
          docker build -t ${APP_NAME}-back:${DOCKER_TAG}  -f Back/Dockerfile  .

          # Tags latest pour simplifier le compose prod local
          docker tag ${APP_NAME}-front:${DOCKER_TAG} ${APP_NAME}-front:latest
          docker tag ${APP_NAME}-back:${DOCKER_TAG}  ${APP_NAME}-back:latest
        '''
      }
    }

    // 👉 Si plus tard tu veux pousser sur DockerHub, ajoute le stage suivant
    /*
    stage('Push DockerHub') {
      when { branch 'main' }
      environment { DOCKERHUB = credentials('dockerhub') }  // crée ce credential si besoin
      steps {
        sh '''
          set -eux
          echo "${DOCKERHUB_PSW}" | docker login -u "${DOCKERHUB_USR}" --password-stdin
          docker tag ${APP_NAME}-front:${DOCKER_TAG} ${DOCKERHUB_USR}/${APP_NAME}-front:${DOCKER_TAG}
          docker tag ${APP_NAME}-back:${DOCKER_TAG}  ${DOCKERHUB_USR}/${APP_NAME}-back:${DOCKER_TAG}
          docker tag ${APP_NAME}-front:latest ${DOCKERHUB_USR}/${APP_NAME}-front:latest
          docker tag ${APP_NAME}-back:latest  ${DOCKERHUB_USR}/${APP_NAME}-back:latest
          docker push ${DOCKERHUB_USR}/${APP_NAME}-front:${DOCKER_TAG}
          docker push ${DOCKERHUB_USR}/${APP_NAME}-back:${DOCKER_TAG}
          docker push ${DOCKERHUB_USR}/${APP_NAME}-front:latest
          docker push ${DOCKERHUB_USR}/${APP_NAME}-back:latest
        '''
      }
    }
    */

    stage('Deploy (docker compose prod local)') {
      when { branch 'main' }
      steps {
        sh '''
          set -eux
          # Si Jenkins est sur la même machine que la prod : déploiement local
          export DOCKER_TAG=${DOCKER_TAG}
          docker compose -f docker-compose.prod.yml up -d --remove-orphans
        '''
      }
    }

    // 👉 Alternative : déploiement SSH sur un serveur distant
    /*
    stage('Deploy remote (SSH)') {
      when { branch 'main' }
      steps {
        sshagent(credentials: ['deploy_ssh']) {
          sh '''
            set -eux
            ssh -o StrictHostKeyChecking=no user@serveur '
              cd /chemin/CESIZEN &&
              export DOCKER_TAG='${DOCKER_TAG}' &&
              docker compose -f docker-compose.prod.yml pull || true &&
              docker compose -f docker-compose.prod.yml up -d --remove-orphans
            '
          '''
        }
      }
    }
    */
  }

  post {
    always {
      // Récup des rapports si tu en génères (JUnit, coverage)
      junit allowEmptyResults: true, testResults: 'Back/**/junit*.xml, Front/**/junit*.xml'
      sh 'docker image prune -f || true'
    }
    success {
      echo "Build OK 🚀  Tag: ${DOCKER_TAG}"
    }
    failure {
      echo "Build KO ❌ — check la console."
    }
  }
}

