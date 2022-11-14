### Terraform for Lambda

# --------------------------------------------------------------------------- #
# Lambda IAM Trust Relationship
# --------------------------------------------------------------------------- #

data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    sid    = ""
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_role_for_lambda" {
  name               = "${local.csi}-lambda-ssl_cert_expiry"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# Lambda IAM Permission Policy
# --------------------------------------------------------------------------- #

data "aws_iam_policy_document" "lambda_ssl_cert_expiry" {
  statement {
    sid    = "AllowCreateAndWriteLogStream"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "${aws_cloudwatch_log_group.ssl_cert_expiry.arn}:*",
    ]
  }
  statement {
    sid    = "AllowListDescribeCertificates"
    effect = "Allow"

    actions = [
      "acm:ListCertificates",
      "acm:DescribeCertificate",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowListAccountAliases"
    effect = "Allow"

    actions = [
      "iam:ListAccountAliases",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "AllowSnsPublish"
    effect = "Allow"

    actions = [
      "sns:Publish",
    ]

    resources = [
      aws_sns_topic.ssl_cert_expiry.arn,
    ]
  }

  statement {
    sid    = "AllowSnsList"
    effect = "Allow"

    actions = [
      "sns:ListTopics",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_policy" "lambda_ssl_cert_expiry" {
  name = "${local.csi}-ssl_cert_expiry"

  description = "IAM Policy to allow reporting on SSL certificate expiry status"
  policy      = data.aws_iam_policy_document.lambda_ssl_cert_expiry.json
}

resource "aws_iam_role_policy_attachment" "ssl_cert_expiry" {
  role       = aws_iam_role.iam_role_for_lambda.name
  policy_arn = aws_iam_policy.lambda_ssl_cert_expiry.arn
}

# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# Cloudwatch Log Group
# --------------------------------------------------------------------------- #

resource "aws_cloudwatch_log_group" "ssl_cert_expiry" {
  name              = "/aws/lambda/${aws_lambda_function.ssl_cert_expiry.function_name}"
  retention_in_days = "90"

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/ssl_cert_expiry"
    },
  )
}

# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# Lambda Function
# --------------------------------------------------------------------------- #

resource "aws_lambda_function" "ssl_cert_expiry" {
  filename         = "${path.module}/files/expiring_certificates.zip"
  source_code_hash = filebase64sha256("${path.module}/files/expiring_certificates.zip")

  function_name = "${local.csi}-ssl_cert_expiry"

  role        = aws_iam_role.iam_role_for_lambda.arn
  handler     = "expiring_certificates.lambda_handler"
  runtime     = "python3.6"
  timeout     = "10"
  memory_size = "128"

  environment {
    variables = {
      SNS_TOPIC = aws_sns_topic.ssl_cert_expiry.name
    }
  }
  # depends_on    = ["aws_iam_role_policy_attachment.ssl_cert_expiry", "aws_cloudwatch_log_group.ssl_cert_expiry"]
}

# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# Cloudwatch Events Rule
# --------------------------------------------------------------------------- #

resource "aws_cloudwatch_event_rule" "ssl_cert_expiry_trigger" {
  name        = "${local.csi}-ssl_cert_expiry"
  description = "${local.csi}-ssl_cert_expiry"

  schedule_expression = "cron(0 12 ? * * *)"
}

resource "aws_cloudwatch_event_target" "ssl_cert_expiry" {
  rule = aws_cloudwatch_event_rule.ssl_cert_expiry_trigger.name
  arn  = aws_lambda_function.ssl_cert_expiry.arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ssl_cert_expiry.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.ssl_cert_expiry_trigger.arn
}

# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# SNS Topic
# --------------------------------------------------------------------------- #

resource "aws_sns_topic" "ssl_cert_expiry" {
  name = "${local.csi}-ssl_cert_expiry"
}

data "aws_iam_policy_document" "sns_ssl_cert_expiry" {
  statement {
    sid    = "AllowMatchingSourceOwnerToPublishToAlertsTopic"
    effect = "Allow"

    actions = [
      "SNS:Publish",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "*",
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        var.aws_account_id,
      ]
    }

    resources = [
      aws_sns_topic.ssl_cert_expiry.arn,
    ]
  }
}

resource "aws_sns_topic_policy" "ssl_cert_expiry" {
  arn    = aws_sns_topic.ssl_cert_expiry.arn
  policy = data.aws_iam_policy_document.sns_ssl_cert_expiry.json
}

# --------------------------------------------------------------------------- #
