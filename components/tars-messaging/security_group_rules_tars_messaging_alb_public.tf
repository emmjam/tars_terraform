# TARS messaging public facing alb rules
resource "aws_security_group_rule" "tars_messaging_alb_public_ingress_whitelist_port_443" {
  description       = "Allow TCP/443 from Internet"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-alb-public.id}"
  cidr_blocks       = ["${var.whitelist}"]
}

resource "aws_security_group_rule" "tars_messaging_alb_public_egress_tars_msg_port_80" {
  description              = "Allow TCP/80 to tars messaging"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-messaging-alb-public.id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}
