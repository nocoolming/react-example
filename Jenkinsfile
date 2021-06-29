pipeline {
    agent any
    
    stages {
        stage('Build'){
            agent { docker 'node:lts-buster-slim' }
            steps {
                sh 'VERSION = $(date +%s)'
                sh 'echo ${VERSION}'
		        sh 'echo "version is :" ${VERSION} '
                sh 'npm i'
                sh 'npm run build'

            }
        }
        stage('Test') {
            steps {
                sh 'ls -al'
            }
        }
        stage('Deploy'){
            agent any
            steps {
                sh 'VERSION = $(date +%s)'
                sh 'echo ${VERSION}'
		        sh 'echo "version is :" ${VERSION} '
                sh 'docker build -t nocoolming/react-app:v${VERSION} .'
                sh 'ls -al '
                sh 'cat ./docker_hub_password.txt | docker login --username nocoolming --password-stdin'
                sh 'docker push nocoolming/react-app:v${VERSION}'
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
