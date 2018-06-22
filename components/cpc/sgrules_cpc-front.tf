resource "aws_security_group_rule" "cpc-front-ingress-cpc-front-alb-8080" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${module.cpc-front.security_group_id}"
  source_security_group_id = "${aws_security_group.cpc-front-alb.id}"
}

resource "aws_security_group_rule" "cpc-front-egress-cpc-back-alb-8080" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${module.cpc-front.security_group_id}"
  source_security_group_id = "${aws_security_group.cpc-back-alb.id}"
}

resource "aws_security_group_rule" "cpc-front_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = "${module.cpc-front.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.base.kms_sg_id}"
}