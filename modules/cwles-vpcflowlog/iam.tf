# The IAM role to be assumed by the VPC Flow Logs principal
# in order to write flow logs to our CloudWatch Logs log groups
resource "aws_iam_role" "vpc_flow_logs" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "vpc-flow-logs",
  )

  assume_role_policy = data.aws_iam_policy_document.vpc_flow_logs_assumerole.json
  # Does not support tags
}

