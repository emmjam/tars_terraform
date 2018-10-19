# TODO: peacheym: Same issue with '-' suffix
# TODO: peacheym: Replace with policy and policy_attachment
resource "aws_iam_user_policy" "ses_allow_send" {
  name   = "${local.csi}-ses-"
  user   = "${aws_iam_user.ses_user.name}"
  policy = "${data.aws_iam_policy_document.ses_user.json}"
}
