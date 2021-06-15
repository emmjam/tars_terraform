# Policy to get  SSM Parameters
data "aws_iam_policy_document" "ssm_parameters_front" {
  statement {
    sid = "AllowGetSSMPars"
    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters"
    ]
    resources = [
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/tars-${var.environment}-epdq-*",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/tars/all/*",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/tars/front/*",
    ]
  }
}

resource "aws_iam_policy" "ssm_parameters_front" {
  name        = "${local.csi}-ssm_parameters"
  description = "IAM policy for ${local.csi}-ssm_parameters_front"
  policy      = data.aws_iam_policy_document.ssm_parameters_front.json
}


# Policy to get  SSM Parameters
data "aws_iam_policy_document" "ssm_parameters_back" {
  statement {
    sid = "AllowGetSSMPars"
    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters"
    ]
    resources = [
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/tars-${var.environment}-epdq-*",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/tars/all/*",
      "arn:aws:ssm:${var.aws_region}:${var.aws_account_id}:parameter/${var.environment}/tars/back/*",
    ]
  }
}

resource "aws_iam_policy" "ssm_parameters_back" {
  name        = "${local.csi}-ssm_parameters"
  description = "IAM policy for ${local.csi}-ssm_parameters_back"
  policy      = data.aws_iam_policy_document.ssm_parameters_back.json
}