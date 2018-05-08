resource "aws_iam_role" "cloudtrail" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "cloudtrail"
  )}"

  assume_role_policy = "${data.aws_iam_policy_document.cloudtrail_assumerole.json}"
}

resource "aws_iam_role_policy" "cloudtrail_put_cloudwatchlogs" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "cloudtrail"
  )}"

  role   = "${aws_iam_role.cloudtrail.id}"
  policy = "${data.aws_iam_policy_document.cloudtrail_put_cloudwatchlogs.json}"
}
