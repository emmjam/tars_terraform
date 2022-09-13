resource "aws_cloudwatch_log_group" "wf-messaging" {
  name = "/aws/ec2/tars-${var.environment}-messaging/current_diagnosis.json"
}