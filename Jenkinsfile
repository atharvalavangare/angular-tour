pipeline {
    agent any
    tools {
        dockerTool 'TestAppAngularDocker'  // Make sure 'TestAppAngularDocker' is correctly defined in Jenkins tools
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/atharvalavangare/angular-tour.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh '/usr/local/bin/docker build -t hero-img .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh '/usr/local/bin/docker run -d -p 80:80 hero-img'
                }
            }
        }
    }
}