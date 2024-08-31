pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Cloning the repository
              git url: 'https://github.com/Ignius-Namikaze/M1_Q2.git', branch: 'main'
            }
        }
        stage('Build') {
          steps {
            script {
              // Execute the batch script
              bat 'deploy.bat TestSuite.xml'
            }
          }
        }
      stage('Post Build') {
        steps {
          echo 'Build completed'
        }
      }
    }

  post {
    always {
      echo 'Pipeline has finished'
    }
  }
}
