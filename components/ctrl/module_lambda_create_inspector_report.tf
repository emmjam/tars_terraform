module "create_inspector_report" {
  source = "../../modules/lambda"

  count = var.kms_inspector_count

  project     = var.project
  component   = var.component
  environment = var.environment
  env_variables = {
    ENVIRONMENT = var.environment
  }

  s3_bucket = "tars-nonprod-ctrl-resources"
  s3_key    = "lambda-repo/packages/inspector-report/inspector-create-report-${var.create_inspector_report_lambda_version}.zip"

  name        = "create-inspector-report"
  runtime     = "python3.8"
  memory_size = "128"
  handler     = "inspector_create_report.lambda_handler"
  timeout     = "60"
  publish     = false

  cwlg_retention_in_days = "90"
}

resource "aws_lambda_permission" "create_inspector_report" {
  count         = var.kms_inspector_count
  statement_id  = "AllowExecutionFromCloudWatchEventRuleEmailInspectorReport"
  action        = "lambda:InvokeFunction"
  function_name = module.create_inspector_report[count.index].function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.email_inspector_report[count.index].arn
}
