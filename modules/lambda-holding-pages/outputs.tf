output "lambda_holding_pages_lambda_arn" {
  value       = "${aws_lambda_function.holding-pages.qualified_arn}"
  description = "The Amazon Resource Name (ARN) identifying the Holding PagesLambda Function"
}
