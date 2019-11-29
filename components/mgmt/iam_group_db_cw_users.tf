resource "aws_iam_group" "db_cw_users" {
  count = "${length(var.db_cw_users) == 0 ? 0 : 1}"
  name = "DBCWAccess"
  path = "/"
}
