resource "aws_iam_user" "users" {
  count         = "${length(var.users)}"
  name          = "${element(var.users, count.index)}"
  path          = "/"
  force_destroy = "true"
}
