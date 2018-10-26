resource "aws_cloudwatch_log_group" "lambda_logstoes" {
  name              = "/aws/lambda/${aws_lambda_function.logstoes.function_name}"
  retention_in_days = "90"

  tags = "${merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/logstoes"
    )
  )}"
}
