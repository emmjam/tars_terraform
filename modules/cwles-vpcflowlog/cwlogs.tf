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

# The subscription that configures the Cloudwatch Logs group
# to send incoming events to the logstoes Lambda function
resource "aws_cloudwatch_log_subscription_filter" "lambda_logstoes_vpc_flow_logs" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "vpc-flow-logs"
  )}"

  log_group_name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "vpc-flow-logs"
  )}"

  filter_pattern  = "[version, account_id, interface_id, srcaddr != \"-\", dstaddr != \"-\", srcport != \"-\", dstport != \"-\", protocol, packets, bytes, start, end, action, log_status]"
  destination_arn = "${var.cwles_logstoes_lambda_arn}"

  depends_on = [
    "aws_lambda_permission.logstoes_allow_flow_logs",
  ]
}

# The permissions needed for the Cloudwatch Logs principal to
# invoke the logstoes Lambda function
resource "aws_lambda_permission" "logstoes_allow_flow_logs" {
  statement_id  = "AllowExecutionFromCWLESFlowLogLogGroup-${var.vpc_id}"
  action        = "lambda:InvokeFunction"
  function_name = "${var.cwles_logstoes_lambda_arn}"

  principal = "${format(
    "logs.%s.amazonaws.com",
    data.aws_region.current.name
  )}"

  source_arn = "${aws_cloudwatch_log_group.vpc_flow_logs.arn}"
}
