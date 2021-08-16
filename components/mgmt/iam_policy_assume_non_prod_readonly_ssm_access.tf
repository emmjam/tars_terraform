resource "aws_iam_policy" "assume_nonprod_readonly_ssm_access" {
  name   = "${local.csi}-assumenonprodreadonlyssmaccess"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_nonprod_readonly_ssm_access.json
}
