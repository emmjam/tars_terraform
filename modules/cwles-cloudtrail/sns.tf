resource "aws_sns_topic" "cloudtrail" {
  name = "${format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "cwles",
    "cloudtrail"
  )}"
}
