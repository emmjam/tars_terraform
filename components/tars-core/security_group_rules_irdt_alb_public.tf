# TARS public facing alb rules
resource "aws_security_group_rule" "irdt_alb_public_ingress_whitelist_port_443" {
  description       = "Allow TCP/443 from Internet"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.irdt-alb-public.id}"
  cidr_blocks       = ["${var.whitelist}"]
}

resource "aws_security_group_rule" "irdt_alb_public_egress_irdt_front_port_7443" {
  description              = "Allow TCP/7443 to irdt core frontend"
  type                     = "egress"
  from_port                = 7443
  to_port                  = 7443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.irdt-alb-public.id}"
  source_security_group_id = "${aws_security_group.tars-core-frontend.id}"
}

