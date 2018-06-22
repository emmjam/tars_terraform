resource "aws_security_group_rule" "cpc-front-alb_ingress_public" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  security_group_id        = "${aws_security_group.cpc-front-alb.id}"
  cidr_blocks              = ["${var.whitelist}"]
}

resource "aws_security_group_rule" "cpc-front-alb_egress_cpc-front" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${aws_security_group.cpc-front-alb.id}"
  source_security_group_id = "${module.cpc-front.security_group_id}"
}

