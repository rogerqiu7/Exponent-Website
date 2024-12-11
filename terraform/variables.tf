# variables.tf
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "app_name" {
  description = "Name of the Amplify application"
  type        = string
  default     = "exponent_calculator"
}

variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
  default     = "exponent-calculator-api"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "lambda_filename" {
  description = "Name of the Lambda deployment package"
  type        = string
  default     = "lambda_function.zip"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "exponent-calculator-processor"
}

variable "lambda_handler" {
  description = "Lambda function handler"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_timeout" {
  description = "Lambda function timeout in seconds"
  type        = string
  default     = 30
}

variable "lambda_role_name" {
  description = "Name of the Lambda IAM role"
  type        = string
  default     = "exponent-calculator-lambda-role"
}

variable "lambda_policy_name" {
  description = "Name of the Lambda IAM policy"
  type        = string
  default     = "exponent-calculator-lambda-policy"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
  default     = "exponent-calculator-table"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "exponent-database-devops-project"
}