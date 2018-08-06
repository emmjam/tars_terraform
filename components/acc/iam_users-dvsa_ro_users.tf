resource "aws_iam_user" "dvsa_ro_users" {
  count         = "${length(var.dvsa_ro_users)}"
  name          = "${element(var.dvsa_ro_users, count.index)}"
  path          = "/"
  force_destroy = "true"
}
