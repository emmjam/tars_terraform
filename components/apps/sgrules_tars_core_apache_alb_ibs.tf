resource "aws_security_group_rule" "tars_core_apache_egress_ibs_alb" {
  count                    = contains(var.ibs1_ibs2_redirect_env, var.environment) ? 1 : 0
  description              = "Allow TCP/80 to IBS Internal ALB"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-apache-sg-id
  source_security_group_id = aws_security_group.ibs-alb.id
}

