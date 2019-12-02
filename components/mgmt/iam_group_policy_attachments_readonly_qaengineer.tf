resource "aws_iam_group_policy_attachment" "readonly_qaengineer" {
  count      = "${length(var.readonly_qaengineer_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.readonly_qaengineer.name}"
  policy_arn = "${aws_iam_policy.assume_readonly_role_qaengineer.arn}"
}

resource "aws_iam_group_policy_attachment" "readonly_no_secrets_qaengineer" {
  count      = "${length(var.readonly_qaengineer_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.readonly_qaengineer.name}"
  policy_arn = "${aws_iam_policy.assume_readonly_role_qaengineer.arn}"
}
