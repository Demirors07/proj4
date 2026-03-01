pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "karne07/proj4-app"
        DOCKER_TAG = "latest"
        DOCKER_CREDENTIALS_ID = "dockerhub-cred"
    }

    triggers {
        githubPush()
    }

    stages {

        stage('Stage 1 - Clone') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/Demirors07/proj4.git'
            }
        }

        stage('Stage 2 - Build Jar') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Stage 3 - Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
            }
        }

        stage('Stage 4 - Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "$DOCKER_CREDENTIALS_ID",
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Stage 5 - Push Image') {
            steps {
                sh 'docker push $DOCKER_IMAGE:$DOCKER_TAG'
            }
        }

        stage('Stage 6 - Deploy to Minikube') {
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }

    }
}