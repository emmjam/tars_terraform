resource "aws_iam_group" "readonly_ssm_access_no_secrets" {
  name = "ReadOnlySSMAccessNoSecrets"
  path = "/"
}
