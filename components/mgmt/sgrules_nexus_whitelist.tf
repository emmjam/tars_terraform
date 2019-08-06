resource "aws_security_group_rule" "nexus_ingress_nat_https" {
  count             = "${length(aws_eip.nat.*.id)}"
  type              = "ingress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = "${aws_security_group.nexus_alb.id}"

  cidr_blocks = [
    "${element(aws_eip.nat.*.public_ip,count.index)}/32",
  ]
}

