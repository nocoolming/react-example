pipeline {
    agent { docker ''}
    stages {
        stage('build'){
            steps {
                sh 'npm i'
                sh 'npm run build'
                sh 'docker build -t nocoolming/react-app:latest version .'
            }
        }
    }
}