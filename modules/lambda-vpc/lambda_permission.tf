resource "aws_lambda_permission" "allow_invoke" {
  count         = var.principal_service != "" ? 1 : 0
  statement_id  = "AllowInvokeFunction"
  function_name = aws_lambda_function.main.function_name
  action        = "lambda:InvokeFunction"
  principal     = "${var.principal_service}.amazonaws.com"
  source_arn    = var.invoker_source_arn
}
