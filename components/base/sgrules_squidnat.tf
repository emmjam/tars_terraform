resource "aws_security_group_rule" "squidnat_ingress_core_https" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  security_group_id        = "${module.squidnat.security_group_id}"
  source_security_group_id = "${aws_security_group.core.id}"
}

resource "aws_security_group_rule" "squidnat_ingress_core_http" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "80"
  to_port                  = "80"
  security_group_id        = "${module.squidnat.security_group_id}"
  source_security_group_id = "${aws_security_group.core.id}"
}

resource "aws_security_group_rule" "squidnat_ingress_core_explicit" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "3128"
  to_port                  = "3128"
  security_group_id        = "${module.squidnat.security_group_id}"
  source_security_group_id = "${aws_security_group.core.id}"
}
