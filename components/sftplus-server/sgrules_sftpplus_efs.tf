# Rule to permit access to EFS Mount Targets from cluster
resource "aws_security_group_rule" "sftpplus_efs_ingress_sftpplus_nfs" {
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.sftpplus_efs.id}"
  source_security_group_id = "${module.sftpplus_svr.security_group_id}"
}

resource "aws_security_group_rule" "sftpplus_egress_sftpplus_efs_nfs" {
  type                     = "egress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${module.sftpplus_svr.security_group_id}"
  source_security_group_id = "${aws_security_group.sftpplus_efs.id}"
}

resource "aws_security_group_rule" "sftpplus_batch_efs_ingress_efs_backup_nfs" {
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.sftpplus_efs.id}"
  source_security_group_id = "${data.terraform_remote_state.base.efs_backup_sg_id}"
}