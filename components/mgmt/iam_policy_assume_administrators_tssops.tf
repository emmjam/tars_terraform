resource "aws_iam_policy" "assume_administrators_role_tssops" {
  name   = "${local.csi}-assumeadministratorsroletssops"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_administrators_role_tssops.json
}
