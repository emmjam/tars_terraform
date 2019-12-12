resource "aws_iam_group" "db_cw_users" {
  name = "DBCWAccess"
  path = "/"
}
