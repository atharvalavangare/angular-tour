pipeline {
    agent any

    environment {
        // Define environment variables for Docker and GitHub
        DOCKER_IMAGE_NAME = "hero-img"
        GITHUB_REPO = "https://github.com/atharvalavangare/angular-tour.git"
        BRANCH = "master"  // Specify your branch
    }

    stages {
        stage('Pull from GitHub') {
            steps {
                script {
                    // Pull the latest code from the GitHub repository
                    git branch: "${BRANCH}", url: "${GITHUB_REPO}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh """
                        docker build -t ${DOCKER_IMAGE_NAME}:latest .
                    """
                }
            }
        }

        stage('Deploy Docker Image') {
            steps {
                script {
                    // Deploy the Docker image (example using Docker run)
                    // You can replace with your deployment strategy (e.g., Kubernetes, Docker Compose)
                    sh """
                        docker run -d -p 80:80 ${DOCKER_IMAGE_NAME}:latest
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}