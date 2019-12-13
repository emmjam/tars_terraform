#Billing Read Only policy
data "aws_iam_policy_document" "billing_ro_users" {
  statement {
    sid    = "AllowBillingReadOnly"
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

