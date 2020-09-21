resource "aws_iam_role" "lambda_cron" {
  name = replace(
    format(
      "%s-%s-%s-%s-%s",
      var.project,
      var.environment,
      var.component,
      var.module,
      var.function_name
    ),
    "_",
    ""
  )

  assume_role_policy = data.aws_iam_policy_document.lambda_assumerole.json
}

resource "aws_iam_role_policy" "lambda_cron" {
  name = replace(
    format(
      "%s-%s-%s-%s-%s",
      var.project,
      var.environment,
      var.component,
      var.module,
      var.function_name
    ),
    "_",
    ""
  )

  role   = aws_iam_role.lambda_cron.id
  policy = var.iam_policy_document
}
