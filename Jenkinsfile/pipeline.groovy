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
                    sh 'python -m pip install --upgrade pip'
                    sh 'pip install -r requirements.txt'
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
    }
}
