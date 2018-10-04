resource "aws_security_group_rule" "active_mq_ingress_tars_messaging" {
  description              = "Allow TCP/61617 from TARS Messaging"
  type                     = "ingress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.awsmq_sg_id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}
