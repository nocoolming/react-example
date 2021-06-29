def createVersion(){
    return new Date().getTime()
}
pipeline {
    agent any
    environment {
        version = createVersion()
    }
    stages {
        stage('Build'){
            agent { docker 'node:lts-buster-slim' }
            steps {
                sh 'echo $version'
		        sh 'echo "version is :" $version '
                sh 'npm i'
                sh 'npm run build'
                sh 'ls'
            }
        }
        stage('Test') {
            steps {
                sh 'ls -al'
                sh 'echo $version'
            }
        }
        stage('Deploy'){
            agent any
            steps {
                sh 'echo $version'
                sh 'docker build -t nocoolming/react-app:v$version .'
                sh 'ls -al '
                sh 'cat ./docker_hub_password.txt | docker login --username nocoolming --password-stdin'
                sh 'docker push nocoolming/react-app:v$version'
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
