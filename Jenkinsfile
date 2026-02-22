pipeline {
    agent any
    tools {
        jdk 'jdk17'
        maven 'maven3'
    }
    stages {
        stage('Compile and Test') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Remplacez 'student-mgmt' par le nom que vous voulez
                sh 'docker build -t student-management-app:latest .'
            }
        }
        stage('SONARQUBE') {
    environment {
        // Remplacez par VOTRE IP de VM
        SONAR_HOST_URL = 'http://192.168.56.10:9000/' 
        // Doit correspondre à l'ID créé dans Jenkins Credentials
        SONAR_AUTH_TOKEN = credentials('sonarqube') 
    }
    steps {
        sh "mvn sonar:sonar \
            -Dsonar.projectKey=devops_git \
            -Dsonar.host.url=${SONAR_HOST_URL} \
            -Dsonar.token=${SONAR_AUTH_TOKEN}"
    }
}
    }
}
