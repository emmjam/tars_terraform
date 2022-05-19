resource "aws_iam_policy" "email_inspector_report" {
  count       = var.kms_inspector_count
  name        = "${local.csi}-email-inspector-report"
  description = "IAM policy for ${local.csi}-email-inspector-report"
  policy      = data.aws_iam_policy_document.email_inspector_report[count.index].json
}

