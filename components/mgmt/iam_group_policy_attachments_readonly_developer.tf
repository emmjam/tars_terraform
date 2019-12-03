resource "aws_iam_group_policy_attachment" "readonly_developer" {
  count      = "${length(var.readonly_developer_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.readonly_developer.name}"
  policy_arn = "${aws_iam_policy.assume_readonly_role_developer.arn}"
}

resource "aws_iam_group_policy_attachment" "readonly_no_secrets_developer" {
  count      = "${length(var.readonly_developer_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.readonly_developer.name}"
  policy_arn = "${aws_iam_policy.assume_readonly_role_developer.arn}"
}
