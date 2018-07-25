resource "aws_security_group_rule" "oem_dba_ingress" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "5500"
  to_port                  = "5500"
  security_group_id        = "${aws_security_group.dms-oem.id}"
  cidr_blocks              = ["${var.whitelist}"]
}

resource "aws_security_group_rule" "oem_dba_ingress_rds" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "1521"
  to_port                  = "1521"
  security_group_id        = "${aws_security_group.dms-oem.id}"
  cidr_blocks              = ["${var.whitelist}"]
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

resource "aws_security_group_rule" "tars_dms_oem_ingress_XE" {
  description              = "Allow TCP/5500 from XE"
  type                     = "ingress"
  from_port                = 5500
  to_port                  = 5500
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-dms.id}"
  source_security_group_id = "${aws_security_group.oraclexe.id}"
}

