resource "aws_ses_receipt_rule_set" "acm" {
  count         = "${var.public_domain_name == "" ? "0" : "1" }"
  rule_set_name = "${local.csi}-acm"
}

resource "aws_ses_receipt_rule" "acm" {
  count         = "${var.public_domain_name == "" ? "0" : "1" }"
  name          = "${local.csi}-acm"
  rule_set_name = "${aws_ses_receipt_rule_set.acm.rule_set_name}"
  enabled       = true
  scan_enabled  = true

  recipients = [
    "admin@${var.public_domain_name}",
  ]

  sns_action {
    topic_arn = "${aws_sns_topic.acm.arn}"
    position  = 1
  }
}
