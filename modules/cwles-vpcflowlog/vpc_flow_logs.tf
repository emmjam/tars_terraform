# The VPC Flow Log stream to send VPC network data
# the a CloudWatch Logs log group
resource "aws_flow_log" "main" {
  log_group_name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "vpc-flow-logs",
  )

  iam_role_arn = aws_iam_role.vpc_flow_logs.arn
  vpc_id       = var.vpc_id
  traffic_type = "ALL"
  # Does not support tags
}

