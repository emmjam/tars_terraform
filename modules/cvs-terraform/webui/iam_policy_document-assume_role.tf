data "aws_iam_policy_document" "apig_assumerole" {
  statement {
    sid     = "AllowApiGatewayAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }
  }
}
