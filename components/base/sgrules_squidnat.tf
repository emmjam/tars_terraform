resource "aws_security_group_rule" "squidnat_ingress_core_https" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  source_security_group_id = "${aws_security_group.core.id}"
  security_group_id        = "${module.squidnat.security_group_id}"
}

resource "aws_security_group_rule" "squidnat_ingress_core_http" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "80"
  to_port                  = "80"
  source_security_group_id = "${aws_security_group.core.id}"
  security_group_id        = "${module.squidnat.security_group_id}"
}

