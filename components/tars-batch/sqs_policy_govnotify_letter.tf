resource "aws_sqs_queue_policy" "letter_gov_notify" {
  queue_url = data.terraform_remote_state.base.outputs.sqs_lettergovnotify_id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement":  [
    {
      "Sid": "AllowLetterGovNotify",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${module.tars_batch.iam_role_arn}"
      },
      "Action": "sqs:*",
      "Resource": "${data.terraform_remote_state.base.outputs.sqs_lettergovnotify_arn}"
    }

  ]
}
POLICY
}
