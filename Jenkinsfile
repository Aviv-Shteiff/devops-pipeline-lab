pipeline {
    agent any
    stages {
        stage('Prepare env') {
            steps {
                withCredentials([file(credentialsId: 'devops-lab-env', variable: 'ENV_FILE')]) {
                    sh 'cp "$ENV_FILE" .env'
                }
            }
        }
        stage('Run') {
            steps {
                sh 'docker compose up -d --build'
            }
        }
        stage('Health check') {
            steps {
                sh './healthcheck.sh'
            }
        }
    }
    post {
        always {
            sh '''
                docker compose logs --tail=30 || true
                docker compose down -v || true
                rm -f .env
            '''
        }
    }
}