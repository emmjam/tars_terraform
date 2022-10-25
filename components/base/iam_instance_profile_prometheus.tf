# Allow the use of the hiera KMS key
resource "aws_iam_role_policy_attachment" "hieradata-prometheus" {
  role       = module.prometheus.iam_role_name
  policy_arn = data.terraform_remote_state.acc.outputs.hieradata_kms_key_user_policy_arn
}

resource "aws_iam_role_policy_attachment" "prometheus" {
  role       = module.prometheus.iam_role_name
  policy_arn = aws_iam_policy.prometheus.arn
}

resource "aws_iam_role_policy_attachment" "prometheus_describe_efs" {
  role       = module.prometheus.iam_role_name
  policy_arn = aws_iam_policy.prometheus_describe_efs.arn
}