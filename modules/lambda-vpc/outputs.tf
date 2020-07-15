output "arn" {
  value       = aws_lambda_function.main.arn
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function"
}

output "function_name" {
  value       = aws_lambda_function.main.function_name
  description = "A unique name for your Lambda Function"
}

output "qualified_arn" {
  value       = aws_lambda_function.main.qualified_arn
  description = "The Amazon Resource Name (ARN) identifying your Lambda Function Version"
}

output "invoke_arn" {
  value       = aws_lambda_function.main.invoke_arn
  description = "The ARN to be used for invoking Lambda Function from API Gateway"
}

output "version" {
  value       = aws_lambda_function.main.version
  description = "Latest published version of your Lambda Function"
}

output "role_name" {
  value       = aws_iam_role.main.name
  description = "The name of the role"
}

output "log_group_name" {
  value       = aws_cloudwatch_log_group.main.name
  description = "The name of the log group"
}

output "security_group_id" {
  value       = aws_security_group.main.id
  description = "The ID of the security group"
}
