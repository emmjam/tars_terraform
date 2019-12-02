resource "aws_iam_group_policy_attachment" "qaengineer" {
  count      = "${length(var.qaengineer_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.qaengineer.name}"
  policy_arn = "${aws_iam_policy.assume_qaengineer_role.arn}"
}
