resource "aws_security_group_rule" "cpc-back-ingress-cpc-back-alb-8080" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${module.cpc-back.security_group_id}"
  source_security_group_id = "${aws_security_group.cpc-back-alb.id}"
}

resource "aws_security_group_rule" "cpc_egress_oracle_db" {
  description              = "Allow TCP/1521 to CPC DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${module.cpc-back.security_group_id}"
  source_security_group_id = "${aws_security_group.cpc-db.id}"
}

resource "aws_security_group_rule" "cpc_back_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = "${module.cpc-back.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.base.kms_sg_id}"
}

resource "aws_security_group_rule" "cpc_back_egress_active_mq" {
  description              = "Allow TCP/61616, 61617 to AWS MQ"
  type                     = "egress"
  from_port                = 61616
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = "${module.cpc-back.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.base.awsmq_sg_id}"
}

resource "aws_security_group_rule" "cpc_back_egress_tars_back_alb" {
  description              = "Allow TCP/8080 to TARS back ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${module.cpc-back.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
}

resource "aws_security_group_rule" "cpc_back_egress_dvla_elise" {
  description       = "Allow TCP/443 to DVLA Elise"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${module.cpc-back.security_group_id}"

  cidr_blocks = [
    "${var.dvla_elise_server}",
  ]
}

resource "aws_security_group_rule" "cpc_back_egress_cpc_back_alb" {
  description              = "Allow TCP/8080 to CPC back ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${module.cpc-back.security_group_id}"
  source_security_group_id = "${aws_security_group.cpc-back-alb.id}"
}
