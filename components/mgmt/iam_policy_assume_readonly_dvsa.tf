resource "aws_iam_policy" "assume_readonly_role_dvsa" {
  name   = "${local.csi}-assumereadonlyroledvsa"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_readonly_role_dvsa.json
}
