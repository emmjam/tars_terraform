resource "aws_security_group_rule" "efs_backup_egress_cpc_batch_efs_nfs" {
  type                     = "egress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.efs_backup_sg_id}"
  source_security_group_id = "${aws_security_group.cpc_batch_efs.id}"
}
