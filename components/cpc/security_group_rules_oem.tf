resource "aws_security_group_rule" "oem_dba_ingress" {
  description              = "Allow OEM Ingress from whitelist"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "5500"
  to_port                  = "5500"
  security_group_id        = "${aws_security_group.cpc-oem.id}"
  cidr_blocks              = ["${var.whitelist}"]
}

