resource "aws_sqs_queue_policy" "send_gov_notify" {
  queue_url = data.terraform_remote_state.base.outputs.sqs_send_govnotify_id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement":  [
    {
      "Sid": "AllowGNSendBatch",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${module.tars_batch.iam_role_name}"
      },
      "Action": "sqs:*",
      "Resource": "${data.terraform_remote_state.base.outputs.sqs_send_govnotify_arn}"
    },
    {
      "Sid": "AllowSendLambda",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${data.terraform_remote_state.base.outputs.lambda_notify_role_arn}"
      },
      "Action": "sqs:*",
      "Resource": "${data.terraform_remote_state.base.outputs.sqs_send_govnotify_arn}"
    }

  ]
}
POLICY
}

resource "aws_sqs_queue_policy" "results_gov_notify" {
  queue_url = data.terraform_remote_state.base.outputs.sqs_results_govnotify_id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement":  [
    {
      "Sid": "AllowGNResultsBatch",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${module.tars_batch.iam_role_name}"
      },
      "Action": "sqs:*",
      "Resource": "${data.terraform_remote_state.base.outputs.sqs_results_govnotify_arn}"
    },
    {
      "Sid": "AllowResultsLambda",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${data.terraform_remote_state.base.outputs.lambda_notify_role_arn}"
      },
      "Action": "sqs:*",
      "Resource": "${data.terraform_remote_state.base.outputs.sqs_results_govnotify_arn}"
    }
  ]
}
POLICY
}

