resource "aws_security_group_rule" "cpc_db_ingress_cpc_batch" {
  description              = "Allow TCP/1521 from CPC Batch"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.cpc.outputs.cpc-db-sg-id
  source_security_group_id = module.cpc_batch.security_group_id
}

