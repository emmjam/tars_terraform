resource "aws_security_group_rule" "prometheus_egress_oracle_db" {
  description              = "Allow TCP/1521 from Prometheus to RDS"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.base.outputs.prometheus_sg_id
  source_security_group_id = aws_security_group.cpc-db.id
}

