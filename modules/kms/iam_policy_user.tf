# Create the Key Policy for the AWS KMS Key
resource "aws_iam_policy" "user" {
  name = format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module,
    var.name,
    "user",
  )

  path   = "/"
  policy = data.aws_iam_policy_document.user.json
}

