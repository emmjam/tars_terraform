resource "aws_iam_policy" "billing_ro_users" {
  count  = "${length(var.billing_ro_users) == 0 ? 0 : 1}"
  name   = "billing_ro_users"
  path   = "/"
  policy = "${data.aws_iam_policy_document.billing_ro_users.json}"
}