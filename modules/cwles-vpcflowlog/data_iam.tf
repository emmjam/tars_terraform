# The policy that allows the VPC Flow Logs service
# to assume the vpc_flow_logs role
data "aws_iam_policy_document" "vpc_flow_logs_assumerole" {
  statement {
    sid    = "VPCFlowLogsAssumeRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "vpc-flow-logs.amazonaws.com",
      ]
    }
  }
}

# The attachment of the vpc_flow_logs_cloudwatch
# policy to the vpc_flow_logs role
resource "aws_iam_role_policy" "vpc_flow_logs" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "vpc-flow-logs"
  )}"

  role   = "${aws_iam_role.vpc_flow_logs.id}"
  policy = "${data.aws_iam_policy_document.vpc_flow_logs_cloudwatch.json}"

  # Does not support tags
}

# The policy that allows the VPC FLow Log Role to
# write logs to our CloudWatch Logs log groups
data "aws_iam_policy_document" "vpc_flow_logs_cloudwatch" {
  statement {
    sid    = "AllowVPCFlowLogsWriteCloudwatchLogsLogGroup"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "${aws_cloudwatch_log_group.vpc_flow_logs.arn}",
    ]
  }

  statement {
    sid    = "AllowVPCFlowLogsReadCloudwatchLogs"
    effect = "Allow"

    actions = [
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = [
      "*",
    ]
  }
}
