resource "aws_security_group_rule" "fyndi-f-ingress-tars-backend-8080" {
  description              = "Allow TCP/8080 from fyndi-f"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
  source_security_group_id = module.fyndi-f.security_group_id
}

resource "aws_security_group_rule" "fyndi-b-ingress-tars-backend-8080" {
  description              = "Allow TCP/8080 from fyndi-b"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
  source_security_group_id = module.fyndi-b.security_group_id
}

