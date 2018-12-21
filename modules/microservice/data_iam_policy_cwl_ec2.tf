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

    resources = [
      # This ARN allows an instance to create a log stream with a name other
      # than its own validated Instance ID (by the use of the trailing asterisk
      # that is already part of the ARN).
      # In order to more explicitly restrict this policy we would need access
      # to an IAM policy variable that contains only the Instance ID.
      # The closest option is ${aws:username} which would give us a combination
      # of the Instance Profile's Access Key and the Instance ID - however we
      # would then be limited to using this key from logging clients on the
      # the instances, making us look up this information rather than simply
      # using the easily available Instance ID, potentially adding additional
      # complication to LogStream consumers in aggregating source information.
      # It's a difficult call as to which is the correct approach, however at
      # this time, it is not deemed a criticalily necessity to restrict the
      # name of the LogStream used by the instance and therefore this ARN
      # construction is sufficient and requires no additional string manipulation.
      "${aws_cloudwatch_log_group.ec2.*.arn}"
    ]
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
