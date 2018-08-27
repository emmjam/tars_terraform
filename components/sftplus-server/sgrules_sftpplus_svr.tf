#
resource "aws_security_group_rule" "sftpplus_ingress_cpc" {
  description       = "Allow TCP/15021 in from NLB for CPC"
  type              = "ingress"
  from_port         = "15021"
  to_port           = "15021"
  protocol          = "tcp"
  security_group_id = "${module.sftpplus_svr.security_group_id}"
  cidr_blocks       = [ "${var.cpc-back_subnets_cidrs}" ]
}

resource "aws_security_group_rule" "sftpplus_ingress_dva" {
  description       = "Allow TCP/15021 in from NLB for DVA"
  type              = "ingress"
  from_port         = "15021"
  to_port           = "15021"
  protocol          = "tcp"
  security_group_id = "${module.sftpplus_svr.security_group_id}"
  cidr_blocks       = ["${var.dva_whitelist}"]
}



