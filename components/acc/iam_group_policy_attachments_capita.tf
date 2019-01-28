resource "aws_iam_group_policy_attachment" "capita_users" {
  count      = "${length(var.capita_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.capita_users.name}"
  policy_arn = "${aws_iam_policy.capita_users.arn}"
}

resource "aws_iam_group_policy_attachment" "capita_users_enforce_mfa" {
  count      = "${length(var.capita_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.capita_users.name}"
  policy_arn = "${aws_iam_policy.enforce_mfa.arn}"
}

resource "aws_iam_group_policy_attachment" "capita_archive_users" {
  count      = "${length(var.capita_users) == 0 ? 0 : 1}"
  group      = "${aws_iam_group.capita_archive_users.name}"
  policy_arn = "${aws_iam_policy.legacy-tape-archive-access.arn}"
}