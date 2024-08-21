pipeline {
    agent any
 
    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image with the tag 'latest'
                    docker.build('myapplication:latest')
                }
            }
        }
 
        stage('Test') {
            steps {
                script {
                    // Run tests inside the Docker container
                    docker.image('myapplication:latest').inside {
                        sh 'npm test'  // or any other test command
                    }
                }
            }
        }
 
        stage('Deploy') {
            steps {
                script {
                    // Define the target image tag for the Docker registry
                    def targetImage = 'chintalasaiakshitha12/myapplication:latest'
                    // Tag the built image with the target repository path and tag
                    sh "docker tag myapplication:latest ${targetImage}"
                    // Log in to Docker Hub (Ensure you have Docker Hub credentials configured)
                    withDockerRegistry([credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/']) {
                        // Push the tagged image to the Docker registry
                        sh "docker push ${targetImage}"
                    }
                }
            }
        }
    }
    // Cleanup workspace after the pipeline run
    post {
        always {
            deleteDir()
        }
    }
}