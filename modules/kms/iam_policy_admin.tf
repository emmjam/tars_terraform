# Create the Key Policy for the AWS KMS Key
resource "aws_iam_policy" "admin" {
  name = format(
    "%s-%s-%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    var.module,
    var.name,
    "admin",
  )

  path   = "/"
  policy = data.aws_iam_policy_document.admin.json
}

