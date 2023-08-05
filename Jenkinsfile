pipeline {
    agent any
    options {
            ansiColor('xterm')
    }
    environment {
                AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
                AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('ChekOut') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rstraining4/terraform-k8s.git']]])
            }
        }
        stage('terraform init') {
            steps {
                sh ('terraform init')
            }
        }
        stage('terraform action') {
            steps {
               echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve')
            }
        }
    }
}
