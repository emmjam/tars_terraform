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
        "AWS": "${module.tars_batch.iam_role_name}"
      },
      "Action": "sqs:*",
      "Resource": "${data.terraform_remote_state.tars-core.outputs.sqs_send_govnotify_arn}"
    }
  ]
}
POLICY
}
