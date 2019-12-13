data "aws_iam_policy_document" "sonarqube" {
  statement {
    sid    = "AttachEBS"
    effect = "Allow"

    actions = [
      "ec2:AttachVolume",
      "ec2:DescribeVolumes",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "sonarqube" {
  name        = "${var.project}-${var.environment}-${var.component}-sonarqube"
  description = "IAM policy for ${var.project}-${var.environment}-${var.component}-sonarqube"
  policy      = data.aws_iam_policy_document.sonarqube.json
}

resource "aws_iam_policy_attachment" "sonarqube" {
  name = "${var.project}-${var.environment}-${var.component}-sonarqube"
  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  roles      = [module.microservice_sonarqube.iam_role_name]
  policy_arn = aws_iam_policy.sonarqube.arn
}

