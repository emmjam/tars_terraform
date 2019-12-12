resource "aws_security_group_rule" "tars_batch_egress_mis_rds" {
  description              = "Allow TCP/1521 from tars_batch to MISDB"
  type                     = "egress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-batch.outputs.tars-batch-sg-id
  source_security_group_id = aws_security_group.tars-mis-db.id
}

resource "aws_security_group_rule" "tars_batch_egress_rsis_rds" {
  description              = "Allow TCP/1521 from tars_batch to RSISDB"
  type                     = "egress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-batch.outputs.tars-batch-sg-id
  source_security_group_id = aws_security_group.tars-rsis-db.id
}

