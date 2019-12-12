# Rule to permit access to EFS Mount Targets from cluster
resource "aws_security_group_rule" "sftpplus_efs_ingress_sftpplus_nfs" {
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sftpplus_efs.id
  source_security_group_id = module.sftpplus_svr.security_group_id
}

