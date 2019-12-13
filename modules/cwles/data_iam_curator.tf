# The policy for the Lambda Execution Role for the curator function
# permitting HTTP Post to the Elasticsearch Domain, and writing logs
data "aws_iam_policy_document" "lambda_curator" {
  statement {
    sid    = "AllowCreateAndWriteLogStream"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      aws_cloudwatch_log_group.lambda_curator.arn,
    ]
  }

  statement {
    sid    = "AllowFullHTTPElasticsearch"
    effect = "Allow"

    actions = [
      "es:ESHttp*",
    ]

    resources = [
      "${aws_elasticsearch_domain.es.arn}/*",
    ]
  }
}

