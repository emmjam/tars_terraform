resource "aws_iam_policy" "assume_readonly_no_secrets_role_nonprod" {
  name   = "${local.csi}-assumereadonlynosecretsrolenonprod"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_readonly_no_secrets_role_nonprod.json
}
