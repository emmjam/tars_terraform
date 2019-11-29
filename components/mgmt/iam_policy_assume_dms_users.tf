resource "aws_iam_policy" "assume_dms_users_role" {
  name   = "${local.csi}-assumedmsuserssrole"
  path   = "/"
  policy = "${data.aws_iam_policy_document.assume_dms_users_role.json}"
}