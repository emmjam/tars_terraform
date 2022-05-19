resource "aws_iam_policy" "create_inspector_report" {
  count       = var.kms_inspector_count
  name        = "${local.csi}-create-inspector-report"
  description = "IAM policy for ${local.csi}-create-inspector-report"
  policy      = data.aws_iam_policy_document.create_inspector_report.json
}

