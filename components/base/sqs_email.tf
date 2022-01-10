resource "aws_sqs_queue" "send_gov_notify" {
  name = "${local.csi}-Send-SMSGovNotify.fifo"

  receive_wait_time_seconds         = 10
  fifo_queue                  = true
  content_based_deduplication = true
#  kms_master_key_id                 = aws_kms_alias.email_key_alias.id
# kms_data_key_reuse_period_seconds = 3600

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.govnotify_dlq.arn
    maxReceiveCount     = 4
  })

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/Send-SMSGovNotify"
    },
  )

  depends_on = [
    aws_kms_alias.email_key_alias
  ]
}
resource "aws_sqs_queue_policy" "send_gov_notify" {
  queue_url = aws_sqs_queue.send_gov_notify.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement":  [
    {
      "Sid": "Stmt1641547592020",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${module.lambda_notify.role_arn}"
      },
      "Action": "sqs:*",
      "Resource": "${aws_sqs_queue.results_gov_notify.arn}"
    }
  ]
}
POLICY
}

resource "aws_kms_key" "email_key" {
  policy = data.aws_iam_policy_document.kms_root_managed.json
}

resource "aws_kms_alias" "email_key_alias" {
  name          = "alias/${local.csi}-sqs_email_key"
  target_key_id = aws_kms_key.email_key.id
}

resource "aws_sqs_queue" "results_gov_notify" {
  name = "${local.csi}-Results-SMSGovNotify.fifo"

  receive_wait_time_seconds         = 10
  fifo_queue                  = true
  content_based_deduplication = true

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.govnotify_dlq.arn
    maxReceiveCount     = 4
  })

  tags = merge(
    local.default_tags,
    {
      "Name" = "${local.csi}/Results-SMSGovNotify"
    },
  )
}

resource "aws_sqs_queue_policy" "results_gov_notify" {
  queue_url = aws_sqs_queue.results_gov_notify.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "Stmt1641547592020",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${module.lambda_notify.role_arn}"
      },
      "Action": "sqs:*",
      "Resource": "${aws_sqs_queue.results_gov_notify.arn}"
    }
  ]

}
POLICY
}
