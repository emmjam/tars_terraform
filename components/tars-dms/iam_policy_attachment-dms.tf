resource "aws_iam_policy_attachment" "attach_dms_policy" {

  count      = "${length(var.dms_users) == 0 ? 0 : 1}"

  name       = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "enable-dms"
  )}"

  users      = ["${var.dms_users}"]
  policy_arn = "${aws_iam_policy.enable_dms.arn}"
}
