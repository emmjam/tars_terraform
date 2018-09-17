# Private load balancer for CPC
resource "aws_security_group_rule" "sftpplus_ingress_cpc" {
  description       = "Allow TCP/10022 from CPC"
  type              = "ingress"
  from_port         = "10022"
  to_port           = "10022"
  protocol          = "tcp"
  security_group_id = "${module.sftpplus_svr.security_group_id}"
  cidr_blocks       = [ "${var.cpc-back_subnets_cidrs}" ] # CPC Batch uses CPC Back subnet
}

resource "aws_security_group_rule" "cpc_egress_sftpplus_nlb" {
  description       = "Allow TCP/15021 from SFTPPlus to CPC Batch"
  type              = "egress"
  from_port         = "15021"
  to_port           = "15021"
  protocol          = "tcp"
  security_group_id = "${data.terraform_remote_state.cpc-batch.cpc-batch-sg-id}"
  cidr_blocks       = [ "${var.cpc_sftp_subnets_cidrs}"]
}

# Health checks from NLBs
resource "aws_security_group_rule" "sftpplus_ingress_nlb" {
  description       = "Allow TCP/10022 from NLBs"
  type              = "ingress"
  from_port         = "10022"
  to_port           = "10022"
  protocol          = "tcp"
  security_group_id = "${module.sftpplus_svr.security_group_id}"
  cidr_blocks       = [ "${var.cpc_sftp_subnets_cidrs}" ]
}

# Public load balancer for DVA
resource "aws_security_group_rule" "sftpplus_ingress_dva" {
  description       = "Allow TCP/543 in from NLB for DVA"
  type              = "ingress"
  from_port         = "10022"
  to_port           = "10022"
  protocol          = "tcp"
  security_group_id = "${module.sftpplus_svr.security_group_id}"
  cidr_blocks       = ["${var.dva_whitelist}"]
}
