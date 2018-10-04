resource "aws_security_group_rule" "bastion_egress_tars_alb_messaging_port_443" {
  description              = "Allow TCP/443 to tars messaging from bastion"
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
  source_security_group_id = "${aws_security_group.tars-alb-messaging.id}"
}

resource "aws_security_group_rule" "bastion_egress_tars_messaging_RDP" {
  description              = "Allow TCP/3389 to Windows Messaging"
  type                     = "egress"
  from_port                = 3389
  to_port                  = 3389
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}
