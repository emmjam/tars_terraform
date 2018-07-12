resource "aws_security_group_rule" "cpc-front-alb_ingress_public-443" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  security_group_id        = "${aws_security_group.cpc-front-alb.id}"
  cidr_blocks              = ["${var.whitelist}"]
}

resource "aws_security_group_rule" "cpc-front-alb_egress_cpc-front-9443" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "9443"
  to_port                  = "9443"
  security_group_id        = "${aws_security_group.cpc-front-alb.id}"
  source_security_group_id = "${module.cpc-front.security_group_id}"
}

resource "aws_security_group_rule" "cpc-front-alb_egress_cpc-front-7443" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "7443"
  to_port                  = "7443"
  security_group_id        = "${aws_security_group.cpc-front-alb.id}"
  source_security_group_id = "${module.cpc-front.security_group_id}"
}

resource "aws_security_group_rule" "cpc-front-alb_egress_cpc-front-8443" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8443"
  to_port                  = "8443"
  security_group_id        = "${aws_security_group.cpc-front-alb.id}"
  source_security_group_id = "${module.cpc-front.security_group_id}"
}

# Is this 8443?
resource "aws_security_group_rule" "cpc-front-alb_ingress_tars-backend-8443" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8443"
  to_port                  = "8443"
  security_group_id        = "${aws_security_group.cpc-front-alb.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-backend-sg-id}"
}
resource "aws_security_group_rule" "tars-backend_egress_cpc-front-alb-8443" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8443"
  to_port                  = "8443"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-backend-sg-id}"
  source_security_group_id = "${aws_security_group.cpc-front-alb.id}"
}
