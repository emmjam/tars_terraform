resource "aws_iam_user_policy_attachment" "attach_dms_policy_users" {
  count      = "${length(var.dms_users)}"
  user       = "${element(var.dms_users, count.index)}"
  policy_arn = "${aws_iam_policy.enable_dms.arn}"
}
