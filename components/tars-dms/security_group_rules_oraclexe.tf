# OracleXE rules
resource "aws_security_group_rule" "oraclexe_ingress_bjss" {
  description       = "Allow TCP/22 from BJSS"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.oraclexe.id}"

  cidr_blocks = [
    "77.86.30.4/32",
    "148.253.134.213/32",
  ]
}

resource "aws_security_group_rule" "oraclexe_egress_tars_rds_1521" {
  description              = "Allow TCP/1521 outbound"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.oraclexe.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
}

resource "aws_security_group_rule" "tars_rds_ingress_oraclexe_1521" {
  description              = "Allow TCP/1521 inbound"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
  source_security_group_id = "${aws_security_group.oraclexe.id}"
}

resource "aws_security_group_rule" "oraclexe_egress_internet" {
  description       = "Allow internet"
  type              = "egress"
  from_port         = "-1"
  to_port           = "-1"
  protocol          = "-1"
  security_group_id = "${aws_security_group.oraclexe.id}"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}
