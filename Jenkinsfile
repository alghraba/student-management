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
    }
}
