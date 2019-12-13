resource "aws_iam_policy" "cw_ro_users" {
  name   = "cw_ro_users"
  path   = "/"
  policy = data.aws_iam_policy_document.cw_ro_users.json
}

