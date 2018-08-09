resource "aws_security_group_rule" "cpc-back-alb_ingress_cpc_front" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${aws_security_group.cpc-back-alb.id}"
  source_security_group_id = "${module.cpc-front.security_group_id}"
}

resource "aws_security_group_rule" "cpc-back-alb_egress_cpc-back" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${aws_security_group.cpc-back-alb.id}"
  source_security_group_id = "${module.cpc-back.security_group_id}"
}

resource "aws_security_group_rule" "tars_back_egress_cpc_back_alb" {
  description              = "Allow TCP/8080 to CPC back ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-backend-sg-id}"
  source_security_group_id = "${aws_security_group.cpc-back-alb.id}"
}

resource "aws_security_group_rule" "cpc_back_alb_ingress_tars_back" {
  description              = "Allow TCP/8080 from TARS back"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc-back-alb.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-backend-sg-id}"
}

resource "aws_security_group_rule" "cpc_back_alb_ingress_cpc_back" {
  description              = "Allow TCP/8080 from cpc back"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc-back-alb.id}"
  source_security_group_id = "${module.cpc-back.security_group_id}"
}
