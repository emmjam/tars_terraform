resource "aws_iam_user" "ithc_ro_users" {
  count         = "${length(var.ithc_ro_users)}"
  name          = "${element(var.ithc_ro_users, count.index)}"
  path          = "/"
  force_destroy = "true"
}
