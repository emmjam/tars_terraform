resource "aws_iam_group" "dms_users" {
  count = "${length(var.dms_users) == 0 ? 0 : 1}"
  name = "DMSAccess"
  path = "/"
}
