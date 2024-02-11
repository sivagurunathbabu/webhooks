pipeline {
    agent any

   // tools {
        // Define the JDK and Maven installations
     //   jdk 'JDK'
       // maven 'Maven'
    //}

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
                    def mavenCMD = tool 'Maven'
                    sh "${mavenCMD}/bin/mvn clean install"
                }
            }
        }

        stage('Test') {
            steps {
                // Run Maven test phase
                script {
                    def mavenCMD = tool 'Maven'
                    sh "${mavenCMD}/bin/mvn test"
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
