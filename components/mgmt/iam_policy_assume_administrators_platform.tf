resource "aws_iam_policy" "assume_administrators_role_platform" {
  name   = "${local.csi}-assumeadministratorsroleplatform"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_administrators_role_platform.json
}
