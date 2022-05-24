# Allow the use of Parameter Store for this environment
resource "aws_iam_role_policy_attachment" "ibs_parameter_store" {
  role       = module.ibs.iam_role_name
  policy_arn = aws_iam_policy.ibs_parameter_store.arn
}

resource "aws_iam_policy" "ibs_parameter_store" {
  name   = "${local.csi}-ibs-parameter-store"
  policy = data.aws_iam_policy_document.ibs_parameter_store.json
}
