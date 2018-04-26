resource "aws_iam_policy" "capita_users" {
  count  = "${length(var.capita_users) == 0 ? 0 : 1}"
  name   = "capita_users"
  path   = "/"
  policy = "${data.aws_iam_policy_document.capita_users.json}"
}
