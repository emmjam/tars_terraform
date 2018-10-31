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

resource "aws_security_group_rule" "oraclexe_egress_cpc_rds_1521" {
  description              = "Allow TCP/1521 outbound"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.oraclexe.id}"
  source_security_group_id = "${data.terraform_remote_state.cpc.cpc-db-sg-id}"
}

resource "aws_security_group_rule" "oraclexe_egress_mis_rds_1521" {
  description              = "Allow TCP/1521 outbound"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.oraclexe.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-reporting.mis-db-sg-id}"
}

resource "aws_security_group_rule" "oraclexe_egress_rsis_rds_1521" {
  description              = "Allow TCP/1521 outbound"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.oraclexe.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-reporting.rsis-db-sg-id}"
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

resource "aws_security_group_rule" "XE_egress_tars_dms_oem" {
  description              = "Allow TCP/5500 to DMS OEM"
  type                     = "egress"
  from_port                = 5500
  to_port                  = 5500
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.oraclexe.id}"
  source_security_group_id = "${aws_security_group.tars-dms.id}"
}

resource "aws_security_group_rule" "XE_egress_tars_dms" {
  description              = "Allow TCP/1521 to DMS"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.oraclexe.id}"
  source_security_group_id = "${aws_security_group.tars-dms.id}"
}
