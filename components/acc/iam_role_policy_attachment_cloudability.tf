resource "aws_iam_role_policy_attachment" "cloudability_cloudability" {
  role       = aws_iam_role.cloudabilityRole.name
  policy_arn = aws_iam_policy.cloudability.arn
}