# Do not hard-code any ARNs that are sourcable data. This is only for purely externally defined entities.
# e.g. OpsGenie
resource "aws_sns_topic_subscription" "alerts_external_subscribers" {
  count                           = "${length(var.alerts_sns_topic_external_subscribers)}"
  topic_arn                       = "${aws_sns_topic.alerts.arn}"
  protocol                        = "${lookup(var.alerts_sns_topic_external_subscribers[count.index], "protocol")}"
  endpoint                        = "${lookup(var.alerts_sns_topic_external_subscribers[count.index], "endpoint")}"
  endpoint_auto_confirms          = "${lookup(var.alerts_sns_topic_external_subscribers[count.index], "endpoint_auto_confirms", "false")}"
  confirmation_timeout_in_minutes = "${lookup(var.alerts_sns_topic_external_subscribers[count.index], "confirmation_timeout_in_minutes", "1")}"
  raw_message_delivery            = "${lookup(var.alerts_sns_topic_external_subscribers[count.index], "raw_message_delivery", "false")}"
  filter_policy                   = "${lookup(var.alerts_sns_topic_external_subscribers[count.index], "filter_policy", "")}"
}

