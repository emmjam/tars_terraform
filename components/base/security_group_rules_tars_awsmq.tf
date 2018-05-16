# SG rules for AWS MQ
resource "aws_security_group_rule" "awsmq_console_ingress_whitelist_https" {
  description       = "Allow TCP/8162 from whitelisted IP addresses"
  type              = "ingress"
  from_port         = 8162
  to_port           = 8162
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-awsmq.id}"
  cidr_blocks       = ["${var.whitelist}"]
}
