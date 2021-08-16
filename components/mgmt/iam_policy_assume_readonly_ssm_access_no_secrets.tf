resource "aws_iam_policy" "assume_readonly_ssm_access_no_secrets" {
  name   = "${local.csi}-assumereadonlyssmaccessnosecrets"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_readonly_ssm_access_no_secrets.json
}
