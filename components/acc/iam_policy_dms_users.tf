resource "aws_iam_policy" "dms_users" {
  name   = "dms_users"
  path   = "/"
  policy = "${data.aws_iam_policy_document.dms_users.json}"
}