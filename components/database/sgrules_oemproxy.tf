resource "aws_security_group_rule" "oemproxy_dba_ingress" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "22"
  to_port                  = "22"
  security_group_id        = "${aws_security_group.oemproxy.id}"
  cidr_blocks              = ["${var.whitelist}"]
}

resource "aws_security_group_rule" "oemproxy_dba_ingress_rds" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  security_group_id        = "${aws_security_group.oemproxy.id}"
  cidr_blocks              = ["${var.whitelist}"]
}

resource "aws_security_group_rule" "oemproxy_dba_egress_oem" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "5500"
  to_port                  = "5500"
  security_group_id        = "${aws_security_group.oemproxy.id}"
  source_security_group_id = "${aws_security_group.oem.id}"
}

resource "aws_security_group_rule" "oemproxy_public" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "1"
  to_port                  = "1024"
  security_group_id        = "${aws_security_group.oemproxy.id}"
  cidr_blocks              = ["0.0.0.0/0"]
}

