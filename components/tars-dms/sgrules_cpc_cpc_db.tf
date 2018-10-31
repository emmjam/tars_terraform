resource "aws_security_group_rule" "cpc_rds_ingress_oraclexe_1521" {
  description              = "Allow TCP/1521 inbound"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.cpc.cpc-db-sg-id}"
  source_security_group_id = "${aws_security_group.oraclexe.id}"
}

resource "aws_security_group_rule" "cpc_rds_ingress_dms_1521" {
  description              = "Allow TCP/1521 inbound from dms"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.cpc.cpc-db-sg-id}"
  source_security_group_id = "${aws_security_group.tars-dms.id}"
}
