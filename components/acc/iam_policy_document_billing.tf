#View Billing Dashboard policy
data "aws_iam_policy_document" "billing" {
  statement {
    sid    = "AllowBillingAccess"
    effect = "Allow"

    actions = [
      "aws-portal:ViewPaymentMethods",
      "aws-portal:ViewAccount",
      "aws-portal:ViewBilling",
      "aws-portal:ViewUsage",
    ]

    resources = [
      "*",
    ]
  }
}
