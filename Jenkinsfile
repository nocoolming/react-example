pipeline {
    agent { docker 'node:lts-buster-slim'}
    stages {
        stage('build'){
            steps {
                sh 'npm i'
                sh 'npm run build'
                sh 'docker build -t nocoolming/react-app:latest version .'
                sh 'cat ~/docker_hub_password | docker login --username nocoolming --password-stdin'
            }
        }
    }
}