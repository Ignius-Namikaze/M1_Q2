pipeline {
    agent any

    stages {
        stages('Checkout') {
            steps {
                // Cloning the repository
              git url: 'https://github.com/Ignius-Namikaze/M1_Q2.git', branch: 'main'
            }
        }
        Stages('Build') {
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
