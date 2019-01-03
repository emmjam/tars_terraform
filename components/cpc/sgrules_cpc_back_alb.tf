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

resource "aws_security_group_rule" "tars_cpc_backend_ingress_tars_frontend_port_8080" {
  description              = "Allow TCP/8080 from TARSfront"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc-back-alb.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-frontend-sg-id}"
}

resource "aws_security_group_rule" "tars_cpc_backend_ingress_tars_batch_port_8080" {
  description              = "Allow TCP/8080 from TARSbatch"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc-back-alb.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-batch-sg-id}"
}
