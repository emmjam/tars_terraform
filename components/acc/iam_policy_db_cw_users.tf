resource "aws_iam_policy" "db_cw_users" {
  name   = "db_cw_users"
  path   = "/"
  policy = "${data.aws_iam_policy_document.db_cw_users.json}"
}