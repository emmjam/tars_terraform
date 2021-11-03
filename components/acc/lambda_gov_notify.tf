### Terraform for Gov Notify Lambda

# --------------------------------------------------------------------------- #
# Lambda IAM Trust Relationship
# --------------------------------------------------------------------------- #

resource "aws_iam_role" "iam_role_for_govnotify_lambda" {
  name               = "${local.csi}-govnotify_service_lambda"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# Lambda IAM Permission Policy
# 
# --------------------------------------------------------------------------- #

data "aws_iam_policy_document" "gov_notify" {
  statement {
    sid    = "AllowCreateAndWriteLogStream"
    effect = "Allow"

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "${aws_cloudwatch_log_group.notify_service.arn}:*",
    ]
  }
  statement {
    sid    = "AllowSqsForGovNotify"
    effect = "Allow"

    actions = [
      "SQS:SendMessage",
      "SQS:DeleteMessage",
      "SQS:ReceiveMessage",
      "SQS:GetQueueAttributes"
    ]
  }
  statement {
    sid    = "AllowGovKeyLookup"
    effect = "Allow"

    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters",
    ]

    resources = [
      "arn:aws:ssm:*:*:parameter/Gov*", // need adjusting
    ]
  }
  statement {
    sid    = "AllowSnsPublish"
    effect = "Allow"

    actions = [
      "sns:Publish",
    ]

    resources = [
      aws_sns_topic.dead_letter_cloudwatch.arn,
      aws_sns_topic.lambda_invocations_cloudwatch.arn,
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

  statement {
    sid    = "AllowS3GetObject"
    effect = "Allow"

    actions = [
      [
        "s3:ListBucket",
        "s3:GetObjectVersion",
        "s3:GetObject",
        "s3:GetBucketVersioning",
        "s3:GetBucketLocation",
      ],
    ]

    resources = [
      aws_s3_bucket.lambda_artefacts.arn,
      "${aws_s3_bucket.lambda_artefacts.arn}/*",
    ]
  }
}

resource "aws_iam_policy" "gov_notify" {
  name = "${local.csi}-govnotify_service_lambda"

  description = "IAM Policy to allow reporting on Government notifications gov notify"
  policy      = data.aws_iam_policy_document.gov_notify.json
}

resource "aws_iam_role_policy_attachment" "gov_notify" {
  role       = aws_iam_role.iam_role_for_notify_lambda.name
  policy_arn = aws_iam_policy.gov_notify.arn
}

# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# Cloudwatch Log Group
# --------------------------------------------------------------------------- #

resource "aws_cloudwatch_log_group" "notify_service" {
  //count             = contains("mgmt", var.environment) ? 0 : 1
  name              = "/aws/lambda/${aws_lambda_function.notify_service.function_name}"
  retention_in_days = "90" //"${var.log_retention}"

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/gov_notify"
    },
  )
}

resource "aws_cloudwatch_metric_alarm" "metric_name_invocations" {
  count                     = "1"
  alarm_name                = "${local.csi}-lambda-invocation-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "Invocations"
  namespace                 = "AWS/Lambda"
  period                    = "60"
  statistic                 = "Sum"
  threshold                 = "2500"
  alarm_description         = "${local.csi} notify invocations"
  alarm_actions             = ["${aws_sns_topic.lambda_invocations_cloudwatch.arn}"]

  dimensions = {
    FunctionName = "${aws_lambda_function.notify_service.function_name}"
  }
}

resource "aws_cloudwatch_metric_alarm" "sqs_dead_letter_queue" {
  count                     = "1"
  alarm_name                = "${local.csi}-dead-letter-alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "ApproximateNumberOfMessagesVisible"
  namespace                 = "AWS/SQS"
  period                    = "60"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "${local.csi} dead letter queue"
  alarm_actions             = ["${aws_sns_topic.dead_letter_cloudwatch.arn}"]

  dimensions = {
    QueueName = "${aws_sqs_queue.dead_letter.name}"
  }
}

# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# Lambda Function
# --------------------------------------------------------------------------- #

resource "aws_lambda_function" "notify_service" {

  //count            = contains("mgmt", var.environment) ? 0 : 1
  handler          = "${var.notifier_lambda_vars["notifier_lambda_handler"]}"
  description      = "Lambda function for sending messages to GOV Notify"
  function_name    = "${local.csi}-notify-service"
  runtime          = "${var.notifier_lambda_vars["notifier_lambda_runtime"]}"
  memory_size      = "${var.notifier_lambda_vars["notifier_memory_size"]}"
  timeout          = "${var.notifier_lambda_vars["notifier_lambda_timeout"]}"
  role             = "${aws_iam_role.iam_role_for_govnotify_lambda.arn}"

  s3_bucket        = aws_s3_bucket.lambda_artefacts.id
  s3_key           = "${var.notifier_lambda_vars["notifier_s3_key"]}"

  environment {
    variables = {
      //NOTIFY_API_KEY_ENCRYPTED = "${var.notifier_lambda_vars["notify_api_key"]}", //param store variable
      LOG_LEVEL = "ERROR",
    }
  }
}

# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# SNS Topic
# --------------------------------------------------------------------------- #

resource "aws_sns_topic" "dead_letter_cloudwatch" {
  //count = contains("mgmt", var.environment) ? 0 : 1
  name  = "${local.csi}-dead-letter-cloudwatch"
}

resource "aws_sns_topic" "lambda_invocations_cloudwatch" {
  //count = contains("mgmt", var.environment) ? 0 : 1
  name  = "${local.csi}-lambda-invocations-cloudwatch"
}

data "aws_iam_policy_document" "sns_gov_notify" {
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
      aws_sns_topic.lambda_invocations_cloudwatch.arn,
      aws_sns_topic.dead_letter_cloudwatch.arn,
    ]
  }
}

resource "aws_sns_topic_policy" "sns_gov_notify_dead_letter" {
  arn    = aws_sns_topic.dead_letter_cloudwatch.arn
  policy = data.aws_iam_policy_document.sns_gov_notify.json
}

resource "aws_sns_topic_policy" "sns_gov_notify_invocations" {
  arn    = aws_sns_topic.lambda_invocations_cloudwatch.arn
  policy = data.aws_iam_policy_document.sns_gov_notify.json
}

# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# SQS
# --------------------------------------------------------------------------- #


resource "aws_sqs_queue" "dead_letter" {
  count = contains("mgmt", var.environment) ? 0 : 1
  name = "${local.csi}-dead-letter"
}

resource "aws_sqs_queue" "messages" {
  count          = contains("mgmt", var.environment) ? 0 : 1
  name           = "${local.csi}-messages"
  redrive_policy = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.dead_letter.arn}\",\"maxReceiveCount\":3}"

  depends_on = [
    "aws_sqs_queue.dead_letter"
  ]
}