
resource "aws_iam_access_key" "ses_user" {
  count = var.ses_user_access_key ? 1 : 0
  user  = aws_iam_user.ses_user.name
}
