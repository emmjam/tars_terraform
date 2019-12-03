resource "aws_iam_group" "readonly_dvsa" {
  count = "${length(var.readonly_dvsa_users) == 0 ? 0 : 1}"
  name = "ReadOnlyDVSA"
  path = "/"
}
