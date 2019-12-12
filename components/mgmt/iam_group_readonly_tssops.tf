resource "aws_iam_group" "readonly_tssops" {
  name = "ReadOnlyTSSOps"
  path = "/"
}
