resource "aws_iam_group" "readonly_no_secrets_nonprod" {
  name = "ReadOnlyNoSecretsNonProd"
  path = "/"
}
