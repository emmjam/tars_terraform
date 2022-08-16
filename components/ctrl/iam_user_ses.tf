resource "aws_iam_user" "ses_user" {
  name = "${local.csi}-ses"
  path = "/"
}

