/*

Reference: 

Log Group Name: /aws/ec2/<project>-<environment>-<component>/<nodetype>/<log_name>
Stream Name: <instance_id>

Resulting Log Group ARN:
arn:aws:logs:<region>:<account_id>:log-group:/aws/ec2/<project>-<environment>-<component>/<nodetype>/<log_name>:*

Resulting Log Stream ARN:
arn:aws:logs:<region>:<account_id>:log-group:/aws/ec2/<project>-<environment>-<component>/<nodetype>/<log_name>:log-stream:<instance_id>

*/

data "aws_iam_policy_document" "cwl_ec2" {
  statement {
    sid    = "AllowPutCloudwatchLogs"
    effect = "Allow"

    # We are not permitting creation of LogGroups or putting of
    # Retention Policies by the client, we control them in terraform
    actions = [
      "logs:CreateLogStream",
      "logs:DescribeLogStreams", # Questionable but unharmful
      "logs:PutLogEvents",
    ]

    resources = aws_cloudwatch_log_group.ec2.*.arn
  }

  # This statement is *solely* to work around a bug in the awslogs package.
  # If a log stream does not exist, it tries to create the log group first
  # whether it already exists or not, and if it is denied permission to create,
  # then it fails. If awslogs ever fixes this bug, remove this statement.
  statement {
    sid    = "AllowCreateLogGroup"
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
    ]

    resources = [
      "*",
    ]
  }
}

