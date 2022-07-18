resource "aws_iam_policy" "envis_query_dynamodb" {
  name        = "${local.csi}-envis"
  description = "IAM policy for ${local.csi}-envis-query-dynamodb"
  policy      = data.aws_iam_policy_document.envis_query_dynamodb.json
}

