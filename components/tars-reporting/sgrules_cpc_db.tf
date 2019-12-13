# CPC from MIS
resource "aws_security_group_rule" "cpc_rds_ingress_mis_rds_sg" {
  description              = "Allow TCP/1521 from MIS DB"
  type                     = "ingress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.cpc.outputs.cpc-db-sg-id
  source_security_group_id = aws_security_group.tars-mis-db.id
}

