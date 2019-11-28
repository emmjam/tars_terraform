resource "aws_iam_group_policy_attachment" "administrators_tssops" {
  count      = "${length(var.administrators_tssops_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.administrators_tssops.name}"
  policy_arn = "${aws_iam_policy.assume_administrators_role_tssops.arn}"
}
