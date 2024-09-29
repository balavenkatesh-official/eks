pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS = credentials('dockerhub-credentials') // Replace with your credentials ID
    }
    stages {
        stage('Login to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    sh "echo ${DOCKER_CREDENTIALS_PSW} | docker login -u ${DOCKER_CREDENTIALS_USR} --password-stdin"
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build your Docker image
                sh 'docker build -t balavenkateshhub/hello-world:v3 .'
            }
        }
        stage('Push Docker Image') {
            steps {
                // Push your Docker image to Docker Hub
                sh 'docker push balavenkateshhub/hello-world:v3'
            }    
        }
        stage('change the image version on kube-config') {
            steps {
                // Push your Docker image to Docker Hub
                sh 'sed -i 's/balavenkateshhub\/hello-world:v4/balavenkateshhub\/hello-world:v1/g' frontend-1.yaml'
            }    
        }
        stage('apply the changed image version on kube-config') {
            steps {
                // Push your Docker image to Docker Hub
                sh 'kubectl apply -f .'
            }    
        }        
    }
}

