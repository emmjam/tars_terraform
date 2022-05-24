resource "aws_iam_role_policy_attachment" "reportingxe" {
  count      = var.reporting_xe_count
  role       = module.microservice_reporting_xe[count.index].iam_role_name
  policy_arn = aws_iam_policy.reportingxe[count.index].arn
}
