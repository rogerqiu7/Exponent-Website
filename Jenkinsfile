pipeline {
    agent any
    
    environment {
        AWS_CREDENTIALS = credentials('aws-credentials')
        TERRAFORM_DIR = './terraform'
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
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                dir(TERRAFORM_DIR) {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
    }
    
    post {
        always {
            node {
                cleanWs()
            }
        }
        failure {
            echo '❌ Terraform deployment failed!'
            echo 'Please check the logs above for errors'
        }
        success {
            echo '✅ Terraform deployment succeeded!'
        }
    }
}