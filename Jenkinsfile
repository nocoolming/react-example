pipeline {
    agent { docker 'node:lts-buster-slim'}
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
                sh 'docker version'
            }
        }
        stage('Build'){
            steps {
                sh 'npm i'
                sh 'npm run build'
                sh 'docker build -t nocoolming/react-app:latest version .'
                sh 'ls '
                sh 'cat ~/docker_hub_password | docker login --username nocoolming --password-stdin'
                sh 'docker push nocoolming/react-app:latest'
            }
        }
        stage('Deploy'){
            steps {
                sh 'docker push nocoolming/react-app:latest'
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