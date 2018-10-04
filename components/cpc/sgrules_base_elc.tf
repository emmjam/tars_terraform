resource "aws_security_group_rule" "elc_ingress_backend_port_11211" {
  description              = "cpc backend to 11211 elasticache"
  type                     = "ingress"
  from_port                = "11211"
  to_port                  = "11211"
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.elc_sg_id}"
  source_security_group_id = "${module.cpc-back.security_group_id}"
}

resource "aws_security_group_rule" "backend_egress_elc_port_11211" {
  description              = "cpc backend to 11211 elasticache"
  type                     = "egress"
  from_port                = "11211"
  to_port                  = "11211"
  protocol                 = "tcp"
  source_security_group_id = "${data.terraform_remote_state.base.elc_sg_id}"
  security_group_id        = "${module.cpc-back.security_group_id}"
}

