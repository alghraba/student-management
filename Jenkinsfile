pipeline {
    agent any

    tools {
        // Ces deux noms doivent correspondre aux noms dans "Tools"
        jdk 'jdk17'
        maven 'maven3'
    }

    stages {
        stage('Compile and Test') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
    }
}
