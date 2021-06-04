resource "aws_iam_policy" "assume_billing_role" {
  name   = "${local.csi}-assumebillingrole"
  path   = "/"
  policy = data.aws_iam_policy_document.assume_billing_role.json
}
