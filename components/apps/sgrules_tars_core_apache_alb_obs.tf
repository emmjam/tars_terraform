resource "aws_security_group_rule" "tars_core_apache_egress_private_alb" {
  description              = "Allow TCP/80 to Internal ALB"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-apache-sg-id
  source_security_group_id = aws_security_group.private-alb.id
}

