resource "aws_iam_role_policy_attachment" "dms_users" {
  role       = "${aws_iam_role.dms_users.name}"
  policy_arn = "${aws_iam_policy.dms_users.arn}"
}