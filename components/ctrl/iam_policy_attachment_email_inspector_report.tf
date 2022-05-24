resource "aws_iam_role_policy_attachment" "email_inspector_report" {
  count      = var.kms_inspector_count
  policy_arn = aws_iam_policy.email_inspector_report[count.index].arn

  role = module.email_inspector_report[count.index].role_name
}
