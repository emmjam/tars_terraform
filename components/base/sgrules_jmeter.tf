resource "aws_security_group_rule" "jmeter_ingress_jenkinsnode_1099_1101" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "1099"
  to_port                  = "1101"
  security_group_id        = "${aws_security_group.jmeter.id}"
  source_security_group_id = "${aws_security_group.jenkinsnode.id}"
}

resource "aws_security_group_rule" "jmeter_egress_jenkinsnode_1099_1101" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "1099"
  to_port                  = "1101"
  security_group_id        = "${aws_security_group.jmeter.id}"
  source_security_group_id = "${aws_security_group.jenkinsnode.id}"
}

# jmeter-gitlab
resource "aws_security_group_rule" "jmeter_egress_gitlab_ssh" {
  description       = "Allow TCP/22 to GitLab"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.jmeter.id}"

  cidr_blocks = [
    "${var.mgmt_gitlab_subnet}",
  ]
}

resource "aws_security_group_rule" "jmeter_ingress_jenkinsnode_ssh" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "22"
  to_port                  = "22"
  security_group_id        = "${aws_security_group.jmeter.id}"
  source_security_group_id = "${aws_security_group.jenkinsnode.id}"
}

resource "aws_security_group_rule" "jmeter_ingress_jmeter_1099_1101" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "1099"
  to_port                  = "1101"
  security_group_id        = "${aws_security_group.jmeter.id}"
  self                     = "true"
}

resource "aws_security_group_rule" "jmeter_egress_jmeter_1099_1101" {
  type                     = "egress"
  protocol                 = "tcp" 
  from_port                = "1099"
  to_port                  = "1101"
  security_group_id        = "${aws_security_group.jmeter.id}"
  self                     = "true"
}

resource "aws_security_group_rule" "jenkinsnode_egress_natgw_https" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = "${aws_security_group.jmeter.id}"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "jenkinsnode_egress_natgw_http" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "80"
  to_port           = "80"
  security_group_id = "${aws_security_group.jmeter.id}"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}
