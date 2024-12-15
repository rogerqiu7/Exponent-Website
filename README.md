# Exponent Web App
Full-stack DevOps project using Terraform, AWS, Jenkins, Javascript and REST APIs

## Project Overview
This project uses a simple exponent calculator web application with a complete CI/CD pipeline and cloud infrastructure. When users input a base number and exponent, the application calculates the result and stores the data in a database.

### Architecture
- **Frontend**: Static website hosted on AWS Amplify
- **Backend**: 
  - API Gateway for REST endpoints
  - Lambda function (Python) for calculations
  - DynamoDB for data storage
  - S3 for long-term data archival
  - Athena for data querying

![pics/diagram.png](pics/diagram.png)

### Technology Stack
- **Infrastructure as Code**: Terraform
- **Cloud Provider**: AWS
- **CI/CD**: Jenkins
- **Version Control**: GitHub

## Repository Structure
```
exponent-website/
├── terraform/         # Infrastructure as Code
├── aws-scripts/       # Lambda functions
├── webpage/          # Static website files
└── Jenkinsfile       # CI/CD pipeline configuration
```

## Data Flow
### 1. User enters numbers and name on web interface
![alt text](pics/exponent-webpage.png)

### 2. Interface is hosted on Amplfiy
![alt text](pics/amplify.png)

### 3. API Gateway receives request
![alt text](pics/api-gateway.png)

### 4. Lambda function processes calculation
![alt text](pics/lambda-function.png)

### 5. Results stored in DynamoDB
![alt text](pics/dynamodb-query.png)

### 6. IAM role for Lambda access to DynamoDB
![alt text](pics/iam-role.png)

### 7. Data automatically archived to S3 
![alt text](pics/s3-bucket.png)

### 8. Historical data queryable via Athena
![alt text](pics/athena-query.png)

### 9. Updates to repo and automatically applied using Jenkins
![alt text](pics/jenkins-console.png)
![alt text](pics/jenkins-output.png)