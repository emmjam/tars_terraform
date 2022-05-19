data "aws_iam_policy_document" "create_inspector_report" {
  statement {
    sid    = "CreateFindingsReport"
    effect = "Allow"

    actions = [
      "inspector2:CreateFindingsReport",
    ]

    resources = [
      "*",
    ]
  }
}