data "aws_iam_policy_document" "assume_billing_role" {
  statement {
    sid    = "AllowAssumebillingRole"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/Billing",
      "arn:aws:iam::652856684323:role/Billing",
      "arn:aws:iam::246976497890:role/Billing"
    ]
  }
}
