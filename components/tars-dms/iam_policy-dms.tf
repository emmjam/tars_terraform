resource "aws_iam_policy" "enable_dms" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "dms-policy"
  )}"
  path   = "/"
  policy = "${data.aws_iam_policy_document.enable_dms.json}"
}
