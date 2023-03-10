resource "aws_cloudwatch_log_group" "main" {
  name = "/aws/lambda/${aws_lambda_function.main.function_name}"

  retention_in_days = var.cwlg_retention_in_days

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/${var.name}",
    ),
  )
}
