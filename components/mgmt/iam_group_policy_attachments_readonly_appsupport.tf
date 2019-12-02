resource "aws_iam_group_policy_attachment" "readonly_appsupport" {
  count      = "${length(var.readonly_appsupport_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.readonly_appsupport.name}"
  policy_arn = "${aws_iam_policy.assume_readonly_role_appsupport.arn}"
}
