resource "aws_security_group_rule" "fyndi-b-ingress-private-alb-8080" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = module.fyndi-b.security_group_id
  source_security_group_id = aws_security_group.private-alb.id
}
resource "aws_security_group_rule" "fyndi-b-egress-fyndi-b-rds-3306" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "3306"
  to_port                  = "3306"
  security_group_id        = module.fyndi-b.security_group_id
  source_security_group_id = aws_security_group.ibs_aurora.id
}

resource "aws_security_group_rule" "fyndi-b-egress-tars-backend-8080" {
  description              = "Allow TCP/8080 to TARS Backend"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = module.fyndi-b.security_group_id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
}

resource "aws_security_group_rule" "fyndi-b-egress-tars-core-8080" {
  description              = "Allow TCP/8080 to TARS Backend"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = module.fyndi-b.security_group_id
  source_security_group_id = data.terraform_remote_state.tars-core.outsputs.tars-batch-sg-id
}

