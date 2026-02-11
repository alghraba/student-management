pipeline {
  agent any

  stages {
    stage(‘Checkout’) {
      steps {
        checkout scm
      }
    }

    stage(‘Compile’) {
      steps {
        sh ‘chmod +x mvnw || true’
        sh ‘./mvnw clean compile || mvn clean compile’
      }
    }
  }
}
