resource "aws_iam_policy" "assume_db_cw_users_role" {
  name   = "${local.csi}-assumedbcwusersrole"
  path   = "/"
  policy = "${data.aws_iam_policy_document.assume_db_cw_users_role.json}"
}