resource "aws_iam_group" "capita_perf_ro_users" {
  count = "${length(var.capita_perf_ro_users) == 0 ? 0 : 1}"
  name  = "CapitaPerfROUsers"
  path  = "/"
}

resource "aws_iam_group" "capita_support_ro_users" {
  count = "${length(var.capita_support_ro_users) == 0 ? 0 : 1}"
  name  = "CapitaSupportROUsers"
  path  = "/"
}
