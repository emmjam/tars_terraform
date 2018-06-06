resource "aws_iam_user" "capita_perf_ro_users" {
  count         = "${length(var.capita_perf_ro_users)}"
  name          = "${element(var.capita_perf_ro_users, count.index)}"
  path          = "/"
  force_destroy = "true"
}
