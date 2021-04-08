#QAEngineer EC2 Access policy
data "aws_iam_policy_document" "qaengineer" {
  statement {
    sid    = "AllowQAEngineerAccess"
    effect = "Allow"

    actions = [
      "ec2:RebootInstances",
      "ec2:StartInstances",
      "ec2:StopInstances",
      "ec2:DescribeInstances",
      "ec2:TerminateInstances",
      "autoscaling:Describe*",
      "cloudwatch:*",
      "logs:*",
      "sns:*",
    ]

    resources = [
      "*",
    ]
  }
}
