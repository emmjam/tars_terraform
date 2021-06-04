resource "aws_iam_policy" "assume_readonly_role_appsupport" {
  name   = "${local.csi}-assumereadonlyroleappsupport"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_readonly_role_appsupport.json
}
