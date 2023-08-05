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
stage('Terraform action - init') {
            steps {
				sh ('terraform init')
            }
        }
		stage('Terraform action - plan') {
			when {
				expression {
					params.terra_action == "plan" || params.terra_action == "apply"
				}
			}
            steps {
				sh "pwd"
					script {
						if(params.tf_vars == "") {
							sh "terraform plan"
						}
						else{
							sh 'terraform plan -var="$tf_vars"'

					}

				}
            }
        }
		stage('Terraform action - apply') {
			when {
				expression {
					params.terra_action == "apply"
				}
			}
            steps {
				sh "pwd"
					script {
						if(params.tf_vars == "") {
							sh "terraform apply --auto-approve"
						}
						else{
							sh 'terraform apply -var="$tf_vars" --auto-approve'

					}
				}
            }
        }
		stage('Terraform action - destroy') {
			when {
				expression {
					params.terra_action == "destroy"
				}
			}
            steps {
					sh "pwd"
					sh "terraform plan --destroy"
					sh "terraform destroy --auto-approve"

            }
        }
    }
 }
