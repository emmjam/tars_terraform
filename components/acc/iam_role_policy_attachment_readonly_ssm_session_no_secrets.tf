resource "aws_iam_role_policy_attachment" "readonly_full_ssm_session" {
  role       = "${aws_iam_role.readonly_ssm_session_no_secrets.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "readonly_ssm_session_no_secrets" {
  role       = "${aws_iam_role.readonly_ssm_session_no_secrets.name}"
  policy_arn = "${aws_iam_policy.readonly_ssm_session_no_secrets.arn}"
}
