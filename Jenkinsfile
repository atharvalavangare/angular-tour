pipeline {
    agent any
    tools {
        dockerTool 'TestAppAngularDocker'
    }
    stages{
        stage('Clone Repository'){
            steps{
                git 'https://github.com/atharvalavangare/angular-tour.git'
            }
        }

        stage('Build Docker Image'){
            steps{
                scripts {
                    sh '/usr/local/bin/docker build -t hero-img'
                }
            }
        }
        stage('RUN Docker Container'){
        steps{
            scripts {
                sh '/usr/local/bin/docker run -d -p 80:80 hero-img'

            }
        }
       }

    }
}