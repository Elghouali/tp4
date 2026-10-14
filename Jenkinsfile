pipeline {
    agent any
    
    environment {
        // Appelle ton coffre-fort Jenkins existant
        DOCKERHUB = credentials('dockerhub-credentials')
        IMAGE_NAME = 'elghouali/tp4:latest'
    }

    stages {
        stage('Clonage du code') {
            steps {
                // Jenkins récupère automatiquement le code configuré dans le SCM
                checkout scm
            }
        }
        
        stage('Construction Docker') {
            steps {
                echo 'Construction de l\'image Nginx...'
                bat "docker build -t ${IMAGE_NAME} ."
            }
        }
        
        stage('Publication Docker Hub') {
            steps {
                echo 'Authentification et envoi de l\'image...'
                // Les variables DOCKERHUB_USR et DOCKERHUB_PSW sont générées automatiquement par Jenkins
                bat "docker login -u %DOCKERHUB_USR% -p %DOCKERHUB_PSW%"
                bat "docker push ${IMAGE_NAME}"
            }
        }
    }
    
    post {
        always {
            echo 'Nettoyage de l\'espace de travail...'
            cleanWs()
        }
    }
}