resource "aws_iam_policy" "assume_readonly_role_platform" {
  name   = "${local.csi}-assumereadonlyroleplatform"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_readonly_role_platform.json
}
