resource "aws_security_group_rule" "cpc_egress_sftpplus_nlb" {
  description       = "Allow TCP/15021 from SFTPPlus to CPC Batch"
  type              = "egress"
  from_port         = "15021"
  to_port           = "15021"
  protocol          = "tcp"
  security_group_id = "${data.terraform_remote_state.cpc-batch.cpc-batch-sg-id}"

  cidr_blocks = [
    "${var.cpc_sftp_subnets_cidrs}",
  ]
}
