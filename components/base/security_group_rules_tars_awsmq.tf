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

resource "aws_security_group_rule" "bastion_egress_mq" {
  description              = "Allow TCP/8162 to MQ Console"
  type                     = "egress"
  from_port                = 8162
  to_port                  = 8162
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
  source_security_group_id = "${aws_security_group.tars-awsmq.id}"
}

resource "aws_security_group_rule" "cpc_back_alb_ingress_tars_back" {
  description              = "Allow TCP/8162 MQ Console access from Bastion"
  type                     = "ingress"
  from_port                = 8162
  to_port                  = 8162
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-awsmq.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}
