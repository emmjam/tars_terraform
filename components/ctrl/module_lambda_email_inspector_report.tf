module "email_inspector_report" {
  source = "../../modules/lambda"

  count = var.kms_inspector_count

  project     = var.project
  component   = var.component
  environment = var.environment
  env_variables = {
    ENVIRONMENT = var.environment
  }

  s3_bucket = "tars-nonprod-ctrl-resources"
  s3_key    = "lambda-repo/packages/inspector-report/inspector-email-report-${var.email_inspector_report_lambda_version}.zip"

  name        = "email-inspector-report"
  runtime     = "python3.8"
  memory_size = "300"
  handler     = "inspector_email_report.lambda_handler"
  timeout     = "60"
  publish     = false

  cwlg_retention_in_days = "90"
}


resource "aws_lambda_permission" "email_inspector_report" {
  count         = var.kms_inspector_count
  statement_id  = "AllowExecutionFromS3InspectorBucket"
  action        = "lambda:InvokeFunction"
  function_name = module.email_inspector_report[count.index].function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.inspector_reports[count.index].arn
}


resource "aws_s3_bucket_notification" "email_inspector_report" {
  count  = var.kms_inspector_count
  bucket = aws_s3_bucket.inspector_reports[count.index].id

  lambda_function {
    lambda_function_arn = module.email_inspector_report[count.index].arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "/"
    filter_suffix       = ".csv"
  }
}

