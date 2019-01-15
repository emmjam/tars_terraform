resource "aws_security_group_rule" "oraclexe_egress_mis_rds_1521" {
  description              = "Allow TCP/1521 outbound"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.oraclexe.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-reporting.mis-db-sg-id}"
}

resource "aws_security_group_rule" "mis_rds_ingress_oraclexe_1521" {
  description              = "Allow TCP/1521 inbound"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-reporting.mis-db-sg-id}"
  source_security_group_id = "${aws_security_group.oraclexe.id}"
}