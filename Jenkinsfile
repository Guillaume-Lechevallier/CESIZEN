pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps { checkout scm }
    }
    stage('Lint') {
      parallel {
        stage('Frontend ESLint') {
          when { fileExists('Front/.eslintrc.json') }
          steps {
            dir('Front') {
              sh 'npm ci --legacy-peer-deps'
              sh 'npm run lint'
            }
          }
        }
        stage('Backend Flake8') {
          when { fileExists('Back/requirements.txt') }
          steps {
            dir('Back') {
              sh 'pip install -r requirements.txt flake8'
              sh 'flake8'
            }
          }
        }
      }
    }
    stage('Build') {
      steps {
        dir('Front') {
          sh 'npm ci --legacy-peer-deps'
          sh 'npm run build --configuration production'
        }
      }
    }
    stage('Test') {
      parallel {
        stage('Frontend Tests') {
          when { fileExists('Front/package.json') }
          steps {
            dir('Front') { sh 'npm test || true' }
          }
        }
        stage('Backend Tests') {
          steps {
            dir('Back') { sh 'pytest || true' }
          }
        }
      }
    }
    stage('Analyse') {
      when { expression { return env.SONAR_TOKEN } }
      steps {
        sh 'sonar-scanner'
      }
    }
    stage('Build_Images') {
      steps {
        sh 'docker build -t cesizen-front:${GIT_COMMIT} -f Front/Dockerfile .'
        sh 'docker build -t cesizen-back:${GIT_COMMIT} -f Back/Dockerfile .'
      }
    }
    stage('Push_Images') {
      when { environment name: 'DOCKERHUB_USER' }
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh 'echo "$PASS" | docker login -u "$USER" --password-stdin'
          sh 'docker push cesizen-front:${GIT_COMMIT}'
          sh 'docker push cesizen-back:${GIT_COMMIT}'
        }
      }
    }
    stage('Deploy') {
      when { branch 'main' }
      steps {
        sshagent(credentials: ['deploy-ssh']) {
          sh 'ssh $DEPLOY_HOST "cd /path/to/app && docker compose -f docker-compose.prod.yml pull && docker compose -f docker-compose.prod.yml up -d --remove-orphans"'
        }
      }
    }
  }
  post {
    always {
      junit '**/junit*.xml'
      archiveArtifacts artifacts: '**/coverage/**/*', allowEmptyArchive: true
    }
  }
}
