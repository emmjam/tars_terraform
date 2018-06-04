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
