resource "aws_security_group_rule" "whitelist_ingress_ssh" {
  description       = "Allow TCP/16385 in from NLB for Back"
  type              = "ingress"
  from_port         = "16385"
  to_port           = "16385"
  protocol          = "tcp"
  security_group_id = "${module.xenco.security_group_id}"
  cidr_blocks       = [ "${data.terraform_remote_state.base.subnet_cidrs_tars_backend}" ]
}

resource "aws_security_group_rule" "lbt_ingress_ssh" {
  description       = "Allow TCP/16385 on from NLB for Health Check"
  type              = "ingress"
  from_port         = "16385"
  to_port           = "16385"
  protocol          = "tcp"
  security_group_id = "${module.xenco.security_group_id}"
  cidr_blocks       = [ "${var.xenco_lb_subnets_cidrs}" ]
}

