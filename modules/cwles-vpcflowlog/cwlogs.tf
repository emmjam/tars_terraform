# The Cloudwatch Logs Log Group for the VPC Flow Logs to be written to
resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "vpc-flow-logs"
  )}"

  retention_in_days = "90"

  tags = {
    "Name" = "${format(
      "%s-%s-%s-%s",
      var.project,
      var.environment,
      var.component,
      "vpc-flow-logs"
    )}"

    "Project"     = "${var.project}"
    "Environment" = "${var.environment}"
    "Component"   = "${var.component}"
    "Module"      = "cwles-vpcflowlog"
  }
}

