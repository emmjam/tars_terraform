################################################################################
#
# Squid NAT Security Group Rules
#
################################################################################

resource "aws_security_group_rule" "squidnat_egress_whitelist_https" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = "${aws_security_group.squidnat.id}"

  cidr_blocks = [
    "${var.egress_whitelist}",
  ]
}

resource "aws_security_group_rule" "squidnat_egress_whitelist_http" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "80"
  to_port           = "80"
  security_group_id = "${aws_security_group.squidnat.id}"

  cidr_blocks = [
    "${var.egress_whitelist}",
  ]
}

resource "aws_security_group_rule" "squidnat_egress_whitelist_ssh" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "22"
  to_port           = "22"
  security_group_id = "${aws_security_group.squidnat.id}"

  cidr_blocks = [
    "${var.egress_whitelist}",
  ]
}

resource "aws_security_group_rule" "squidnat_egress_whitelist_tns" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "46465"
  to_port           = "46465"
  security_group_id = "${aws_security_group.squidnat.id}"

  cidr_blocks = [
    "${var.egress_whitelist}",
  ]
}

resource "aws_security_group_rule" "squidnat_egress_whitelist_ses" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "587"
  to_port           = "587"
  security_group_id = "${aws_security_group.squidnat.id}"

  cidr_blocks = [
    "${var.egress_whitelist}",
  ]
}

