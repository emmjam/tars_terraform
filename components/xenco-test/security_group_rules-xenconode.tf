resource "aws_security_group_rule" "whitelist_ingress_ssh" {
  description       = "Allow TCP/22 in from whitelisted IPs"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.xenconode.security_group_id}"
  cidr_blocks       = [ "${var.xenco_whitelist}"]
}

resource "aws_security_group_rule" "internet_egress" {
  description       = "Allow internet access"
  type              = "egress"
  from_port         = "-1"
  to_port           = "-1"
  protocol          = "-1"
  security_group_id = "${module.xenconode.security_group_id}"
  cidr_blocks       = [ "0.0.0.0/0"]
}