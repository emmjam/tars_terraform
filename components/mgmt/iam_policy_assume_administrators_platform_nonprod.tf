resource "aws_iam_policy" "assume_administrators_role_platform_nonprod" {
  name   = "${local.csi}-assumeadministratorsroleplatformnonprod"
  path   = "/"
  policy = "${data.aws_iam_policy_document.assume_administrators_role_platform_nonprod.json}"
}
