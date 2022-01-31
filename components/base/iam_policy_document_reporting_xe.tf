resource "aws_iam_policy" "reportingxe" {
  count = var.reporting_xe_count
  name        = "${local.csi}-reporting-xe"
  description = "IAM policy for ${local.csi}-reporting-xe"
  policy      = data.aws_iam_policy_document.reportingxe.json
}

