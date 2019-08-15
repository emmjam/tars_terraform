# Private load balancer for CPC
resource "aws_security_group_rule" "sftpplus_ingress_cpc" {
  description       = "Allow TCP/10022 from CPC"
  type              = "ingress"
  from_port         = "10022"
  to_port           = "10022"
  protocol          = "tcp"
  security_group_id = "${module.sftpplus_svr.security_group_id}"

  cidr_blocks = [
    "${var.cpc-back_subnets_cidrs}", # CPC Batch uses CPC Back subnet
  ]
}

# Health checks from NLBs
resource "aws_security_group_rule" "sftpplus_ingress_nlb" {
  description       = "Allow TCP/10022 from NLBs"
  type              = "ingress"
  from_port         = "10022"
  to_port           = "10022"
  protocol          = "tcp"
  security_group_id = "${module.sftpplus_svr.security_group_id}"

  cidr_blocks = [
    "${var.cpc_sftp_subnets_cidrs}", "${var.sftpplus_nlb_subnets_cidrs}",
  ]
}

# Public load balancer for DVA
resource "aws_security_group_rule" "sftpplus_ingress_dva" {
  description       = "Allow TCP/543 in from NLB for DVA"
  type              = "ingress"
  from_port         = "10022"
  to_port           = "10022"
  protocol          = "tcp"
  security_group_id = "${module.sftpplus_svr.security_group_id}"

  cidr_blocks = [
    "${var.dva_whitelist}",
  ]
}

resource "aws_security_group_rule" "sftpplus_egress_sftpplus_efs_nfs" {
  type                     = "egress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${module.sftpplus_svr.security_group_id}"
  source_security_group_id = "${aws_security_group.sftpplus_efs.id}"
}
