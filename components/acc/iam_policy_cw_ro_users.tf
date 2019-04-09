resource "aws_iam_policy" "cw_ro_users" {
  count  = "${length(var.db_cw_ro_users) == 0 ? 0 : 1}"
  name   = "cw_ro_users"
  path   = "/"
  policy = "${data.aws_iam_policy_document.cw_ro_users.json}"
}