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
