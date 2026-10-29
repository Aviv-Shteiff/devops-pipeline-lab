pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t devops-pipeline-lab .'
            }
        }
        stage('Run') {
            steps {
                sh '''
                    docker rm -f app
                    docker run -d -p 3000:3000 --name app devops-pipeline-lab
                '''
            }
        }
        stage('Health check') {
            steps {
                sh './healthcheck.sh'
            }
        }
    }
    post {
        always { sh 'docker rm -f app' }
    }
}