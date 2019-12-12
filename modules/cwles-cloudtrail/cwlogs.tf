resource "aws_cloudwatch_log_group" "cloudtrail" {
  name = format(
    "%s-%s-%s/%s/%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "cloudtrail",
  )
}

