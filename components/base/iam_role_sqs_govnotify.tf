data "aws_iam_policy_document" "sqs_govnotify" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["sqs.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "sqs_govnotify" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "sqs_govnotify"
  )

  assume_role_policy = data.aws_iam_policy_document.sqs_govnotify.json
}

resource "aws_iam_role_policy" "sqs_govnotify" {
  name = format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "sqs_govnotify"
  )

  role   = aws_iam_role.sqs_govnotify.id
  policy = data.aws_iam_policy_document.sqs_govnotify.json
}
