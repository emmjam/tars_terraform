resource "aws_cloudwatch_log_group" "lambda_holding_pages" {
  name              = "/aws/lambda/${aws_lambda_function.holding-pages.function_name}"
  retention_in_days = var.cwlg_retention_in_days

  tags = merge(
    local.default_tags,
    tomap({
      "Name"   = "${local.csi}/${var.name}",
      "Module" = var.module,
    })
  )
}
