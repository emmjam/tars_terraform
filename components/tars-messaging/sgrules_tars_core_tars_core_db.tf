resource "aws_security_group_rule" "oracle_db_ingress_tars_messaging" {
  description              = "Allow TCP/1521 from TARS Messaging"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
  source_security_group_id = aws_security_group.tars-messaging.id
}

