pipeline {
    agent any

    tools {
        maven 'Maven3'      // Nom configuré dans Jenkins (Global Tool Configuration)
        jdk 'Java17'        // Nom configuré dans Jenkins
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/alghraba/student-management.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                echo "Deploying application..."
                ls target
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline exécutée avec succès 🎉'
        }
        failure {
            echo 'Échec de la pipeline ❌'
        }
    }
}
