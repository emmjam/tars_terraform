resource "aws_iam_policy" "power_users" {
  count  = "${length(var.power_users) == 0 ? 0 : 1}"
  name   = "power_users"
  path   = "/"
  policy = "${data.aws_iam_policy_document.power_users.json}"
}
