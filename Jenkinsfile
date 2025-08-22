pipeline {
  agent any

  environment {
    APP_NAME   = 'cesizen'
    DOCKER_TAG = "${env.GIT_COMMIT ?: 'latest'}"
  }

  // si tu as configuré le webhook GitHub, tu peux laisser ou enlever:
  triggers { githubPush() }

  options {
    buildDiscarder(logRotator(numToKeepStr: '20'))
    timestamps()
    disableConcurrentBuilds()
  }

  stages {
    stage('Checkout (from SCM)') {
      steps {
        // récupère exactement ce que Jenkins a déjà configuré côté job
        checkout scm
        sh 'git rev-parse --short HEAD && ls -al'
      }
    }

  stage('Build Docker images') {
    steps {
      sh '''
        set -eux
        docker build -t ${APP_NAME}-front:latest -f Front/Dockerfile .
        # NOTE: contexte = Back/
        docker build -t ${APP_NAME}-back:latest  -f Back/Dockerfile Back
      '''
    }
  }


    stage('Deploy (compose prod local)') {
      when { branch 'main' }
      steps {
        sh '''
          set -eux
          docker compose -f docker-compose.prod.yml up -d --remove-orphans
        '''
      }
    }
      stage('Restart prod containers') {
    steps {
        sh '''
            set -eux
            cd $WORKSPACE
            docker compose -f docker-compose.prod.yml restart
        '''
    }
}
  }

  post {
    always {
      junit allowEmptyResults: true, testResults: 'Back/**/junit*.xml, Front/**/junit*.xml'
      sh 'docker image prune -f || true'
    }
  }

}
