resource "aws_security_group_rule" "bastion_egress_mq" {
  description              = "Allow TCP/8162 to MQ Console"
  type                     = "egress"
  from_port                = 8162
  to_port                  = 8162
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
  source_security_group_id = "${aws_security_group.tars-awsmq.id}"
}
