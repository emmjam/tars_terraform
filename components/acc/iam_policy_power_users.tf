resource "aws_iam_policy" "power_users" {
  name   = "power_users"
  path   = "/"
  policy = data.aws_iam_policy_document.power_users.json
}

