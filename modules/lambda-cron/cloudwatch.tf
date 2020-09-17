resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${aws_lambda_function.lambda_cron.function_name}"
  retention_in_days = var.cwl_retention

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
}

resource "aws_cloudwatch_event_rule" "lambda_cron" {
  name = replace(
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

  schedule_expression = var.schedule
  is_enabled          = var.enabled
}

resource "aws_cloudwatch_event_target" "lambda" {
  target_id = replace(
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

  rule = aws_cloudwatch_event_rule.lambda_cron.name
  arn  = aws_lambda_function.lambda_cron.arn
}
