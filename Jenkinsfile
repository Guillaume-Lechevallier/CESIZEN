pipeline {
  agent { docker { image 'docker:27.5.1' args '--privileged -v /var/run/docker.sock:/var/run/docker.sock' } }
  environment {
    DOCKERHUB = credentials('dockerhub')
    SONAR_TOKEN = credentials('sonar-token')
    SONAR_HOST_URL = 'https://sonar.example.com'
  }
  stages {
    stage('Checkout') {
      steps { checkout scm }
    }
    stage('Lint') {
      steps {
        dir('Front') { sh 'npm ci --legacy-peer-deps && npm run lint' }
        dir('Back') { sh 'flake8 .' }
      }
    }
    stage('Build') {
      steps {
        dir('Front') { sh 'npm run build --configuration production' }
      }
    }
    stage('Test') {
      steps {
        dir('Front') { sh 'npm test -- --watch=false' }
        dir('Back') { sh 'pytest --cov=.' }
      }
      post {
        always {
          junit 'Front/test-results/**/*.xml'
          junit 'Back/test-results/**/*.xml'
          archiveArtifacts artifacts: 'coverage/**', allowEmptyArchive: true
        }
      }
    }
    stage('Analyse') {
      steps {
        sh 'sonar-scanner'
      }
    }
    stage('Build_Images') {
      steps {
        script {
          def sha = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
          sh "docker build -f frontend/Dockerfile -t ${DOCKERHUB_USR}/frontend:${sha} -t ${DOCKERHUB_USR}/frontend:latest ."
          sh "docker build -f backend/Dockerfile -t ${DOCKERHUB_USR}/backend:${sha} -t ${DOCKERHUB_USR}/backend:latest ."
          sh "docker build -f nginx/Dockerfile -t ${DOCKERHUB_USR}/nginx:${sha} -t ${DOCKERHUB_USR}/nginx:latest ."
        }
      }
    }
    stage('Push_Images') {
      steps {
        withDockerRegistry([credentialsId: 'dockerhub']) {
          sh 'docker push ${DOCKERHUB_USR}/frontend --all-tags'
          sh 'docker push ${DOCKERHUB_USR}/backend --all-tags'
          sh 'docker push ${DOCKERHUB_USR}/nginx --all-tags'
        }
      }
    }
    stage('Deploy') {
      when { branch 'main' }
      steps {
        sshagent(credentials: ['deploy_ssh']) {
          sh 'ssh $DEPLOY_USER@$DEPLOY_HOST "cd /path/to/app && git pull && docker compose -f docker-compose.prod.yml pull && docker compose -f docker-compose.prod.yml up -d --remove-orphans"'
        }
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: '**/test-results/**/*.xml', allowEmptyArchive: true
    }
  }
}
