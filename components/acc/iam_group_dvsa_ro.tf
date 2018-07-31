resource "aws_iam_group" "dvsa_ro_users" {
  count = "${length(var.dvsa_ro_users) == 0 ? 0 : 1}"
  name  = "DVSAROUsers"
  path  = "/"
}
