# Rule to permit access to EFS Mount Targets from cluster
resource "aws_security_group_rule" "batch_efs_ingress_batch_nfs" {
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.batch_efs.id}"
  source_security_group_id = "${aws_security_group.tars-batch.id}"
}

resource "aws_security_group_rule" "batch_efs_ingress_efs_backup_nfs" {
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.batch_efs.id}"
  source_security_group_id = "${data.terraform_remote_state.base.efs_backup_sg_id}"
}