resource "aws_security_group_rule" "oracle_db_ingress_tars_batch" {
  description              = "Allow TCP/1521 from TARS Batch"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
  source_security_group_id = module.tars_batch.security_group_id
}

