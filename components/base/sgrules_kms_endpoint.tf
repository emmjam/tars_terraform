resource "aws_security_group_rule" "core_ingress_kms" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  source_security_group_id = "${aws_security_group.core.id}"
  security_group_id        = "${aws_security_group.kms_endpoint.id}"
}

