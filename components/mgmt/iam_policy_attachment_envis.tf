
resource "aws_iam_role_policy_attachment" "envis" {
  policy_arn = aws_iam_policy.envis_query_dynamodb.arn

  role = module.envis.role_name
}


