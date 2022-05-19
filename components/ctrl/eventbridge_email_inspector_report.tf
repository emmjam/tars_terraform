resource "aws_cloudwatch_event_rule" "email_inspector_report" {
  count       = var.kms_inspector_count
  name        = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "email_inspector_report",
  )
  description = "email_inspector_report"
  schedule_expression = "cron(0 9 ? * 2#1 *)"

    tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}-email-inspector-report"
    },
  )
}

resource "aws_cloudwatch_event_target" "email_inspector_report" {
  count = var.kms_inspector_count
  arn   = module.create_inspector_report[count.index].arn
  rule  = aws_cloudwatch_event_rule.email_inspector_report[count.index].name
  input = <<JSON
{
  "parameters": {
    "bucket_name": "tars-652856684323-eu-west-1-nonprod-ctrl-inspector-reports",
    "kms_key_arn": "arn:aws:kms:eu-west-1:652856684323:key/83b07d97-6e65-42cb-97fd-21fe538e02b4"
  }
}
    JSON
}


