resource "aws_cloudwatch_metric_alarm" "print_queue_alarm_mq_2" {
  count               = var.print_queue_cw_metric_alarm_enabled ? 1 : 0
  alarm_name          = "${local.csi}-print-queue-alarm-mq-2"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "QueueSize"
  namespace           = "AWS/AmazonMQ"
  treat_missing_data  = "notBreaching"
  period              = "300"
  statistic           = "Sum"
  threshold           = "600"
  alarm_description   = "Alarm when messages in the queue is equal to or greater than 600 for a period of 5 minutes."
  actions_enabled     = var.mq_cw_metric_print_queue_alarm_action_enabled
  alarm_actions       = [aws_sns_topic.alerts.arn]

  dimensions = {
    Broker = "${local.csi}-awsmq-2"
    Queue  = "queue/PrintQueue"
  }
}