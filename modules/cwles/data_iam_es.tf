# The Access Control List policy for restricting access to the Elasticsearch Domain
# public endpoint only to the LogsToES Lambda function and a whitelist of CIDR blocks
data "aws_iam_policy_document" "es_acl" {
  statement {
    sid    = "AllowLambdaRoles"
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        "${aws_iam_role.lambda_logstoes.arn}",
        "${aws_iam_role.lambda_curator.arn}",
      ]
    }

    resources = [
      "${aws_elasticsearch_domain.es.arn}/*",
    ]
  }

  statement {
    sid    = "AllowIPWhitelist"
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        "*",
      ]
    }

    actions = [
      "es:*",
    ]

    resources = [
      "${aws_elasticsearch_domain.es.arn}/*",
    ]

    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"

      values = [
        "${var.es_cidr_whitelist}",
      ]
    }
  }
}
