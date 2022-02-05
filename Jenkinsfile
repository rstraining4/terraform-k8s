pipeline {
    agent any

    stages {
        stage('ChekOut') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rstraining4/terraform-k8s.git']]])
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
