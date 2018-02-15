resource "aws_ses_receipt_rule_set" "acm" {
  count = "${var.public_domain_name == "" ? "0" : "1" }"

  rule_set_name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "acm"
  )}"
}

resource "aws_ses_receipt_rule" "acm" {
  count = "${var.public_domain_name == "" ? "0" : "1" }"

  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "acm"
  )}"

  rule_set_name = "${aws_ses_receipt_rule_set.acm.rule_set_name}"
  recipients    = ["admin@${var.public_domain_name}"]
  enabled       = true
  scan_enabled  = true

  sns_action {
    topic_arn = "${aws_sns_topic.acm.arn}"
    position  = 1
  }
}
