resource "aws_iam_user" "capita_users" {
  count         = "${length(var.capita_users)}"
  name          = "${element(var.capita_users, count.index)}"
  path          = "/"
  force_destroy = "true"
}
