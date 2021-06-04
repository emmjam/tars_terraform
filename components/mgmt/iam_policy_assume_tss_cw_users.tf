resource "aws_iam_policy" "assume_tss_cw_users_role" {
  name   = "${local.csi}-assumetsscwusersrole"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_tss_cw_users_role.json
}
