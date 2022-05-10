data "aws_iam_policy_document" "key2" {
  policy_id = format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module,
    var.name,
    "key",
  )

  statement {
  }

}
