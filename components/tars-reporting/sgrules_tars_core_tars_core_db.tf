resource "aws_security_group_rule" "oracle_db_ingress_mis_rds" {
  description              = "Allow TCP/1521 from MISDB to TARSDB"
  type                     = "ingress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
  source_security_group_id = aws_security_group.tars-mis-db.id
}

resource "aws_security_group_rule" "oracle_db_ingress_rsis_rds" {
  description              = "Allow TCP/1521 from RSISDB to TARSDB"
  type                     = "ingress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
  source_security_group_id = aws_security_group.tars-rsis-db.id
}

resource "aws_security_group_rule" "oracle_db_egress_mis_rds" {
  description              = "Allow TCP/1521 from TARSDB to MISDB"
  type                     = "egress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
  source_security_group_id = aws_security_group.tars-mis-db.id
}

