resource "aws_security_group_rule" "tars_core_apache_egress_cpc_internal_alb" {
  description              = "Allow TCP/80 to CPC Front Internal ALB"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-sg-id
  source_security_group_id = aws_security_group.cpc-front-internal-alb.id
}