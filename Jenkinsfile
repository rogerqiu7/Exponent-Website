pipeline {
    agent any
    
    environment {
        AWS_CREDENTIALS = credentials('aws-credentials')
        TERRAFORM_DIR = './terraform'
        TERRAFORM = '/usr/local/bin/terraform'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Terraform Init') {
            steps {
                dir(TERRAFORM_DIR) {
                    sh '${TERRAFORM} init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                dir(TERRAFORM_DIR) {
                    sh '${TERRAFORM} plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir(TERRAFORM_DIR) {
                    sh '${TERRAFORM} apply -auto-approve tfplan'
                }
            }
        }
    }
    
    post {
        always {
            script {
                node {
                    ws(env.WORKSPACE) {
                        cleanWs()
                    }
                }
            }
        }
        success {
            echo '✅ Terraform deployment succeeded!'
        }
        failure {
            echo '❌ Terraform deployment failed!'
            echo 'Please check the logs above for errors'
        }
    }
}