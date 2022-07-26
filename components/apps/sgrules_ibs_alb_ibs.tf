resource "aws_security_group_rule" "ibs-alb_ingress_public" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = aws_security_group.ibs-alb.id

  cidr_blocks = var.whitelist
}

resource "aws_security_group_rule" "ibs_jmeter_egress_jenkinsnode_1099_1101" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = aws_security_group.ibs-alb.id
  source_security_group_id = module.ibs.security_group_id
}

resource "aws_security_group_rule" "ibs_egress_tars_80" {
  count                    = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "80"
  to_port                  = "80"
  security_group_id        = aws_security_group.ibs-alb.id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-public-sg-id
}