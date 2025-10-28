pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'chanakakodagoda/myapp'
        DOCKER_HUB_CREDENTIALS = 'dockerhub-creds-id'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/chanaka-kodagoda/myapp.git'
            }
        }
    stage('Test Docker Access') {
        steps {
            sh 'docker version'
            sh 'docker ps'
       }
   }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_HUB_REPO}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', "${DOCKER_HUB_CREDENTIALS}") {
                        dockerImage.push()
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }

    post {
        success {
            echo "✅ Build and deployment successful!"
        }
        failure {
            echo "❌ Build or deployment failed."
        }
    }
}
