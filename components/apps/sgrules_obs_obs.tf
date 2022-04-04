resource "aws_security_group_rule" "obs-ingress-private-alb-8080" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = module.obs.security_group_id
  source_security_group_id = aws_security_group.private-alb.id
}

resource "aws_security_group_rule" "obs-ingress-public-alb-8080" {
  # Removing Apache  -- IanD
  description              = "Incomming 8080 from tars-core-apache public alb"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = module.obs.security_group_id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-public-alb-sg-id
}

resource "aws_security_group_rule" "obs-egress-tars-back-8080" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = module.obs.security_group_id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
}

resource "aws_security_group_rule" "obs_egress_oracle_db" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "1521"
  to_port                  = "1521"
  security_group_id        = module.obs.security_group_id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
}

