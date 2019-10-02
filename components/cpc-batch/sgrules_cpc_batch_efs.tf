resource "aws_security_group_rule" "cpc_batch_efs_ingress_cpc_batch_nfs" {
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc_batch_efs.id}"
  source_security_group_id = "${module.cpc_batch.security_group_id}"
}
