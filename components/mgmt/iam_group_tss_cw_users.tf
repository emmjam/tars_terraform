resource "aws_iam_group" "tss_cw_users" {
  name = "TSSCWAccess"
  path = "/"
}
