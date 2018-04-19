# SG rules for AWS MQ
resource "aws_security_group_rule" "awsmq_console_ingress_whitelist_https" {
  description       = "Allow TCP/8162 from whitelisted IP addresses"
  type              = "ingress"
  from_port         = 8162
  to_port           = 8162
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-awsmq.id}"
  cidr_blocks       = ["${var.mq_console_whitelist}"]
}

resource "aws_security_group_rule" "active_mq_ingress_tars_messaging" {
  description              = "Allow TCP/61617 from TARS Messaging"
  type                     = "ingress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-awsmq.id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}