resource "aws_cloudwatch_metric_alarm" "email_queue_alarm_mq_1" {
  count                = var.email_queue_cw_metric_alarm_enabled ? 1 : 0
  alarm_name           = "${local.csi}-email-queue-alarm-mq-1"
  comparison_operator  = "GreaterThanOrEqualToThreshold"
  evaluation_periods   = "5"
  metric_name          = "QueueSize"
  namespace            = "AWS/AmazonMQ"
  treat_missing_data   = "notBreaching"
  period               = "300"
  statistic            = "Sum"
  threshold            = "300"
  alarm_description    = "Alarm when messages in the queue is equal to or greater than 300 for a period of 5 minutes."
  actions_enabled      = var.mq_cw_metric_email_queue_alarm_action_enabled
  alarm_actions        = [aws_sns_topic.alerts.arn]

  dimensions = { 
    Broker = "${local.csi}-awsmq-1"
    Queue = "queue/EmailQueue"
  }
 
}