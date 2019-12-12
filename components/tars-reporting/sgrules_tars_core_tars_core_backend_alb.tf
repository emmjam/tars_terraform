resource "aws_security_group_rule" "tars_backend_ingress_oracle_mis" {
  description              = "Allow TCP/8080 from MISDB to TARS BACKEND"
  type                     = "ingress"
  from_port                = "8080"
  to_port                  = "8080"
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
  source_security_group_id = aws_security_group.tars-mis-db.id
}

