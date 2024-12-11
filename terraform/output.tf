# outputs.tf
output "amplify_app_id" {
  value = aws_amplify_app.frontend.id
}

output "api_endpoint" {
  value = aws_apigatewayv2_stage.main.invoke_url
}

output "lambda_function_name" {
  value = aws_lambda_function.processor.function_name
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.main.name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.data.bucket
}