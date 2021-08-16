resource "aws_iam_group" "nonprod_readonly_ssm_access" {
  name = "NonProdReadOnlySSMAccess"
  path = "/"
}
