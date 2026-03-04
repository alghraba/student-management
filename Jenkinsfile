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
        
        // J'ai déplacé SONARQUBE ici (Avant Docker)
       stage('SONARQUBE') {
    environment {
        SONAR_HOST_URL = 'http://192.168.56.10:9000/'
        SONAR_AUTH_TOKEN = credentials('sonarqube') 
    }
    steps {
        // Utilisation de guillemets simples pour éviter l'interprétation Groovy
        // Et ajout de -Dsonar.login en secours
        sh '''
            mvn sonar:sonar \
            -Dsonar.projectKey=devops_git \
            -Dsonar.host.url=${SONAR_HOST_URL} \
            -Dsonar.login=${SONAR_AUTH_TOKEN}
        '''
    }
           stage('Deploy to Kubernetes') {
    steps {
        script {
            // 'kubeconfig-id' est l'ID que tu as donné lors de l'upload
            withCredentials([file(credentialsId: 'kubeconfig-id', variable: 'KUBECONFIG')]) {
                sh "kubectl --kubeconfig=${KUBECONFIG} apply -f app-config.yaml"
                sh "kubectl --kubeconfig=${KUBECONFIG} apply -f spring-deployment.yaml"
                sh "kubectl --kubeconfig=${KUBECONFIG} apply -f spring-service.yaml"
            }
        }
    }
}
}

       // stage('Build Docker Image') {
       //     steps {
                // Cette étape risque toujours d'échouer tant que 
                // le socket docker n'est pas partagé avec Jenkins
    //            sh 'docker build -t student-management-app:latest .'
            //}
       // }
    }
}
