resource "aws_iam_policy" "capita_perf_ro_users" {
  count  = "${length(var.capita_perf_ro_users) == 0 ? 0 : 1}"
  name   = "capita_perf_ro_users"
  path   = "/"
  policy = "${data.aws_iam_policy_document.capita_perf_ro_users.json}"
}
