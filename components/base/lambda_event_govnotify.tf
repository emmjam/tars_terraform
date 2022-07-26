resource "aws_lambda_event_source_mapping" "govnotify_lambda" {
  event_source_arn = aws_sqs_queue.send_gov_notify.arn
  function_name    = module.lambda_notify.arn
}

resource "aws_lambda_event_source_mapping" "govnotify_lambda_letter" {
  event_source_arn = aws_sqs_queue.lettergovnotify.arn
  function_name    = module.lambda_notify.arn
}