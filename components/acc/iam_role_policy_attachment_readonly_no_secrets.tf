resource "aws_iam_role_policy_attachment" "readonly_full" {
  role       = "${aws_iam_role.readonly_no_secrets.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "readonly_no_secrets" {
  role       = "${aws_iam_role.readonly_no_secrets.name}"
  policy_arn = "${aws_iam_policy.readonly_no_secrets.arn}"
}
