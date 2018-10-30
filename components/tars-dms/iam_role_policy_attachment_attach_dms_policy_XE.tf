resource "aws_iam_role_policy_attachment" "attach_dms_policy_XE" {
  role       = "${var.xe_role_name}"
  policy_arn = "${aws_iam_policy.enable_dms.arn}"
}
