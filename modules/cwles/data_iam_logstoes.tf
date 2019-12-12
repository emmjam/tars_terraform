# The policy for the Lambda Execution Role for logstoes,
# permitting HTTP Post to the Elasticsearch Domain, and writing logs
data "aws_iam_policy_document" "lambda_logstoes" {
  statement {
    sid    = "AllowCreateAndWriteLogStream"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      aws_cloudwatch_log_group.lambda_logstoes.arn,
    ]
  }

  statement {
    sid    = "AllowPostToElasticsearch"
    effect = "Allow"

    actions = [
      "es:ESHttpPost",
    ]

    resources = [
      "${aws_elasticsearch_domain.es.arn}/*",
    ]
  }
}

