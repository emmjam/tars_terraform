resource "aws_security_group_rule" "cpc-front-alb_ingress_public-80" {
  type                      = "ingress"
  protocol                  = "tcp"
  from_port                 = "80"
  to_port                   = "80"
  security_group_id         = "${aws_security_group.cpc-front-internal-alb.id}"
  source_security_group_id  = "${data.terraform_remote_state.tars-core.tars-core-apache-sg-id}"
}

resource "aws_security_group_rule" "cpc-front-alb_egress_cpc-front-9443" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "9443"
  to_port                  = "9443"
  security_group_id        = "${aws_security_group.cpc-front-internal-alb.id}"
  source_security_group_id = "${module.cpc-front.security_group_id}"
}
