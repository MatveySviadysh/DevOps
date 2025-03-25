pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/MatveySviadysh/DevOps'
            }
        }
        stage('Set up Python') {
            steps {
                script {
                    sh './scripts/set-up-python.sh'
                }
            }
        }
        stage('Run tests') {
            steps {
                script {
                    sh 'python -m unittest discover -s app/tests'
                }
            }
        }
        stages('Deploy') {
            steps {
                script {
                    sh 'docker-compose up -d'
                }
            }
        }
    }
}
