resource "aws_iam_role_policy_attachment" "qaengineer" {
  role       = "${aws_iam_role.qaengineer.name}"
  policy_arn = "${aws_iam_policy.qaengineer.arn}"
}