resource "aws_iam_access_key" "ses_user" {
  user = "${aws_iam_user.ses_user.name}"
}
