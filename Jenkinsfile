pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
        stage('Build'){
            agent { docker 'node:lts-buster-slim' }
            steps {
                sh 'docker pull node:lts-buster-slim'
                sh 'npm i'
                sh 'npm run build'

            }
        }
        stage('Deploy'){
            agent any
            steps {
                sh 'docker build -t nocoolming/react-app:latest version .'
                sh 'ls -al '
                sh 'cat ~/docker_hub_password | docker login --username nocoolming --password-stdin'
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