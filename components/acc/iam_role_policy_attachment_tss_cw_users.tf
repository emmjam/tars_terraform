resource "aws_iam_role_policy_attachment" "tss_cw_users" {
  role       = "${aws_iam_role.tss_cw_users.name}"
  policy_arn = "${aws_iam_policy.tss_cw_users.arn}"
}