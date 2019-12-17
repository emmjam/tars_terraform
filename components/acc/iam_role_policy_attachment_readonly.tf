resource "aws_iam_role_policy_attachment" "readonly_access" {
  role       = "${aws_iam_role.readonly.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "readonly_support_access" {
  role       = "${aws_iam_role.readonly.name}"
  policy_arn = "arn:aws:iam::aws:policy/AWSSupportAccess"
}