resource "aws_lambda_function" "lambda_cron" {
  description = replace(
    format(
      "%s-%s-%s-%s-%s",
      var.project,
      var.environment,
      var.component,
      var.module,
      var.function_name
    ),
    "_",
    ""
  )

  function_name = replace(
    format(
      "%s-%s-%s-%s-%s",
      var.project,
      var.environment,
      var.component,
      var.module,
      var.function_name
    ),
    "_",
    ""
  )

  role                = aws_iam_role.lambda_cron.arn
  handler             = var.handler
  runtime             = var.runtime
  publish             = var.publish
  memory_size         = var.memory
  timeout             = var.timeout

  s3_bucket         = var.s3_bucket_name
  s3_key            = var.s3_key
#  s3_object_version = "${var.s3_object_version}"

  vpc_config  {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  environment {
    variables = merge(
      map(
        "REGION", data.aws_region.current.name
      ),
      var.lambda_env_vars
    )
  }

  tags = merge(
    var.default_tags,
    map(
      "Name", format(
        "%s-%s-%s/%s/%s",
        var.project,
        var.environment,
        var.component,
        var.module,
        var.function_name
      ),
      "Component", var.component,
      "Module", var.module
    )
  )
  lifecycle {
    ignore_changes = [
      qualified_arn,
      version,
    ]
  }
}

resource "aws_lambda_permission" "lambda_cron_allow_cloudwatchevents" {
  function_name = aws_lambda_function.lambda_cron.function_name
  statement_id  = "AllowExecutionFromCloudWatchEvent"
  action        = "lambda:InvokeFunction"
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_cron.arn
}
