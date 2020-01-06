resource "aws_iam_role_policy_attachment" "jenkinsnode" {
  policy_arn = aws_iam_policy.jenkinsnode.arn

  role = module.jenkinsnode.iam_role_name
}

