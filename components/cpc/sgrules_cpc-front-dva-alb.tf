resource "aws_security_group_rule" "cpc-front-alb_ingress_dva-543" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "543"
  to_port                  = "543"
  security_group_id        = "${aws_security_group.cpc-front-dva-alb.id}"
  cidr_blocks              = ["${var.dva_whitelist}"]
}

resource "aws_security_group_rule" "cpc-front-alb_egress_cpc-front-7443" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "7443"
  to_port                  = "7443"
  security_group_id        = "${aws_security_group.cpc-front-dva-alb.id}"
  source_security_group_id = "${module.cpc-front.security_group_id}"
}
