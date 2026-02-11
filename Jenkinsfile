pipeline {
    agent any
 
    tools {
        maven 'M2_HOME'
    }
 
    stages {
        stage('Compile & Test') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
    }
}
