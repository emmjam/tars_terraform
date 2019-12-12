resource "aws_iam_policy" "billing_ro_users" {
  name   = "billing_ro_users"
  path   = "/"
  policy = data.aws_iam_policy_document.billing_ro_users.json
}

