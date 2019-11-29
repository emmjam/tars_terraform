resource "aws_iam_group" "billing" {
  count = "${length(var.billing_users) == 0 ? 0 : 1}"
  name = "BillingAccess"
  path = "/"
}
