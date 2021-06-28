pipeline {
    agent any
    stages {
        stage('Build'){
            agent {
                docker 'node:lts-buster-slim'
            }
            steps {
                sh 'npm i'
                sh 'npm run build'
                
            }
        }
        stage('Deploy'){
            steps {
                sh 'echo '
            }
        }
        
    }
    post{
        always { 
            echo 'This well always run'
        }
        success {
            echo 'This will run only if successful'
        }
        changed {
            echo 'This will run only if the state of the Pipline has changed'
            echo 'For example, if the Pipline was previously failling but is now successful'
        }
    }
}