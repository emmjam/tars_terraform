resource "aws_iam_group_policy_attachment" "ithc_ro_users" {
  count      = "${length(var.ithc_ro_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.ithc_ro_users.name}"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "ithc_ro_users_enforce_mfa" {
  count      = "${length(var.ithc_ro_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.ithc_ro_users.name}"
  policy_arn = "${aws_iam_policy.enforce_mfa.arn}"
}
