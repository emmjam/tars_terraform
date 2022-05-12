resource "aws_kms_key" "main" {
  count = var.environment == "mgmt" ? 1 : 0
  description = format(
    "%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module,
    var.name,
  )

  deletion_window_in_days = var.deletion_window
  policy = data.aws_iam_policy_document.key[0].json

  tags = merge(
    var.default_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s-%s",
        var.project,
        var.environment,
        var.component,
        var.module,
        var.name,
      )
      "Module" = var.module
    },
  )
}

