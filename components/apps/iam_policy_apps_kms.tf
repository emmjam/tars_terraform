# Allow the use of the Apps KMS key
resource "aws_iam_role_policy_attachment" "apps_kms_user" {
  role       = module.ibs.iam_role_name
  policy_arn = module.kms_apps_key.user_policy_arn
}
