resource "aws_iam_group" "mgmtlive_readonly_ssm_access_no_secrets" {
  name = "MgmtLiveReadOnlySSMAccessNoSecrets"
  path = "/"
}
