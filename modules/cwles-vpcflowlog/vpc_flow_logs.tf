# The VPC Flow Log stream to send VPC network data
# the a CloudWatch Logs log group
resource "aws_flow_log" "main" {
  log_destination      = aws_cloudwatch_log_group.vpc_flow_logs.arn
  log_destination_type = "cloud-watch-logs"

  iam_role_arn = aws_iam_role.vpc_flow_logs.arn
  vpc_id       = var.vpc_id
  traffic_type = "ALL"
  # Does not support tags
}

