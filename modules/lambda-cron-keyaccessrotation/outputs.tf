output "lambda_arn" {
  value = aws_lambda_function.lambda_cron.arn
}

output "iam_role_name"{
  value = aws_iam_role.lambda_cron.name
}