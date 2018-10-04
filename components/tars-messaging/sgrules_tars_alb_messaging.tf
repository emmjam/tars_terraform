# TARS Private ALB messaging rules
resource "aws_security_group_rule" "tars_alb_messaging_ingress_tars_batch_port_8080" {
  description              = "Allow TCP/8080 from tars batch"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-messaging.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-batch.tars-batch-sg-id}"
}

resource "aws_security_group_rule" "tars_alb_messaging_egress_tars_messaging_port_8080" {
  description              = "Allow TCP/8080 to tars messaging"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-messaging.id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}

resource "aws_security_group_rule" "tars_alb_messaging_ingress_wan_port_443" {
  description       = "Allow TCP/443 from WAN"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-alb-messaging.id}"

  cidr_blocks = [
    "10.0.0.0/8",
  ]
}

resource "aws_security_group_rule" "tars_alb_messaging_egress_tars_msg_port_80" {
  description              = "Allow TCP/80 to tars messaging"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-messaging.id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}

resource "aws_security_group_rule" "tars_alb_messaging_ingress_bastion_port_443" {
  description              = "Allow TCP/443 to tars messaging from bastion"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-messaging.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}
