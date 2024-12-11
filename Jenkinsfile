// Declares a Jenkins pipeline using declarative syntax
pipeline {
    // Specifies that this pipeline can run on any available Jenkins agent/node
    agent any
    
    // Define environment variables that will be available to all stages
    environment {
        // Creates AWS credentials from Jenkins credentials store
        // 'aws-credentials' is the ID you set in Jenkins credentials
        AWS_CREDENTIALS = credentials('aws-credentials')
        
        // Specifies the directory where Terraform configs are located
        // Relative to the root of your repository
        TERRAFORM_DIR = './terraform'
    }
    
    // Define the different stages of our pipeline
    stages {
        // First stage: Check out the code
        stage('Checkout') {
            steps {
                // Checks out code from version control
                // 'scm' refers to the Source Control Management defined in the Jenkins job
                checkout scm
            }
        }
        
        // Second stage: Initialize Terraform
        stage('Terraform Init') {
            steps {
                // Change to the directory containing Terraform files
                dir(TERRAFORM_DIR) {
                    // Run terraform init to initialize working directory
                    // Downloads providers and modules
                    sh 'terraform init'
                }
            }
        }
        
        // Third stage: Create Terraform plan
        stage('Terraform Plan') {
            steps {
                dir(TERRAFORM_DIR) {
                    // Create execution plan and save it to 'tfplan' file
                    sh 'terraform plan -out=tfplan'
                    // Convert the plan to human-readable format and save to tfplan.txt
                    sh 'terraform show -no-color tfplan > tfplan.txt'
                }
            }
        }
        
        // Fourth stage: Get approval for applying changes
        stage('Approval') {
            // This stage only runs on the main branch
            when {
                branch 'main'
            }
            steps {
                script {
                    // Read the contents of the plan file
                    def plan = readFile "${TERRAFORM_DIR}/tfplan.txt"
                    // Pause pipeline execution and wait for manual approval
                    // Shows the plan in the input request
                    input message: "Review the plan:", parameters: [
                        text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)
                    ]
                }
            }
        }
        
        // Fifth stage: Apply the Terraform changes
        stage('Terraform Apply') {
            // This stage only runs on the main branch
            when {
                branch 'main'
            }
            steps {
                dir(TERRAFORM_DIR) {
                    // Apply the saved plan file
                    // -auto-approve skips interactive approval of plan
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
    
    // Actions to perform after all stages have completed
    post {
        // Always run these steps, regardless of pipeline success/failure
        always {
            // Clean up the workspace after pipeline completion
            cleanWs()
        }
        // Run these steps only if pipeline succeeds
        success {
            // Print success messages
            echo '✅ Terraform deployment completed successfully!'
            echo 'Resources have been created/updated in AWS'
        }
        // Run these steps only if pipeline fails
        failure {
            // Print failure messages
            echo '❌ Terraform deployment failed!'
            echo 'Please check the logs above for errors'
        }
    }
}