resource "aws_iam_group_membership" "capita_perf_ro_users" {
  count = "${length(var.capita_perf_ro_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.capita_perf_ro_users.name}"
  group = "${aws_iam_group.capita_perf_ro_users.name}"
  users = ["${var.capita_perf_ro_users}"]
}

resource "aws_iam_group_membership" "capita_support_ro_users" {
  count = "${length(var.capita_support_ro_users) == 0 ? 0 : 1}"
  name  = "${aws_iam_group.capita_support_ro_users.name}"
  group = "${aws_iam_group.capita_support_ro_users.name}"
  users = ["${var.capita_support_ro_users}"]
}
