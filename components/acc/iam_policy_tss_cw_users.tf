resource "aws_iam_policy" "tss_cw_users" {
  name   = "tss_cw_users"
  path   = "/"
  policy = data.aws_iam_policy_document.tss_cw_users.json
}