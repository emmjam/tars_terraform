# TARS Mock public facing alb rules
resource "aws_security_group_rule" "tars_alb_public_ingress_whitelist_port_8443" {
  description       = "Allow TCP/8443 from Internet"
  type              = "ingress"
  from_port         = 8443
  to_port           = 8443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-alb-mock-public.id}"
  cidr_blocks       = ["${var.whitelist}"]
}

resource "aws_security_group_rule" "tars_alb_public_ingress_whitelist_port_9990" {
  description       = "Allow TCP/9990 from Internet"
  type              = "ingress"
  from_port         = 9990
  to_port           = 9990
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-alb-mock-public.id}"
  cidr_blocks       = ["${var.whitelist}"]
}

resource "aws_security_group_rule" "tars_alb_public_egress_tars_front_port_8443" {
  description              = "Allow TCP/8443 to tars mock"
  type                     = "egress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-mock-public.id}"
  source_security_group_id = "${aws_security_group.tars-mock.id}"
}

resource "aws_security_group_rule" "tars_alb_public_egress_tars_front_port_9990" {
  description              = "Allow TCP/9990 to tars mock"
  type                     = "egress"
  from_port                = 9990
  to_port                  = 9990
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-mock-public.id}"
  source_security_group_id = "${aws_security_group.tars-mock.id}"
}
