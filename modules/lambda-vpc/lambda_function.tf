resource "aws_lambda_function" "main" {
  function_name = local.csi_name

  description = "${upper(var.name)} lambda function"

  s3_bucket = var.s3_bucket
  s3_key    = var.s3_key

  runtime     = var.runtime
  handler     = var.handler
  memory_size = var.memory_size
  timeout     = var.timeout

  reserved_concurrent_executions = var.reserved_concurrent_executions

  role = aws_iam_role.main.arn

  vpc_config {
    subnet_ids = var.subnet_ids

    security_group_ids = concat(
      [aws_security_group.main.id],
      var.additional_security_groups,
    )
  }

  environment {
    variables = var.env_variables
  }

  tags = merge(
    local.default_tags,
    map(
      "Name", "${local.csi}/${var.name}",
    ),
  )
}
