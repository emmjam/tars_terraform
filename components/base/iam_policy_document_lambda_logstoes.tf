data "aws_iam_policy_document" "lambda_logstoes" {
  statement {
    sid    = "AllowCreateAndWriteLogStream"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "${aws_cloudwatch_log_group.lambda_logstoes.arn}",
    ]
  }

  statement {
    sid    = "AllowPostToElasticsearch"
    effect = "Allow"

    actions = [
      "es:ESHttpPost",
    ]

    resources = [
      "${data.terraform_remote_state.acc.cwles_es_domain_arn}/*",
    ]
  }
}
