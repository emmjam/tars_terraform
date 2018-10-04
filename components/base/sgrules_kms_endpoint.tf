# TODO: peacheym: this is kms_ingress_core not core_ingress_kms
resource "aws_security_group_rule" "core_ingress_kms" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  security_group_id        = "${aws_security_group.kms_endpoint.id}"
  source_security_group_id = "${aws_security_group.core.id}"
}
