pipeline {
    agent any

   
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your version control system (e.g., Git)
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Build the Maven project
                script {
                    
                    sh "mvn clean install"
                }
            }
        }

        stage('Test') {
            steps {
                // Run Maven test phase
                script {
                    sh "mvn test"
                }
            }
        }
    }

    post {
        success {
            // Actions to perform if the build and tests are successful
            echo 'Build and tests passed!'
        }
        failure {
            // Actions to perform if the build or tests fail
            echo 'Build or tests failed!'
        }
    }
}
