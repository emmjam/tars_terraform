resource "aws_iam_group" "readonly_tssops" {
  count = "${length(var.readonly_tssops_users) == 0 ? 0 : 1}"
  name = "ReadOnlyTSSOps"
  path = "/"
}
