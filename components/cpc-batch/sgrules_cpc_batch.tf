resource "aws_security_group_rule" "cpc_db_ingress_cpc_batch" {
  description              = "Allow TCP/1521 from CPC Batch"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.cpc.cpc-db-sg-id}"
  source_security_group_id = "${module.cpc-batch.security_group_id}"
}

resource "aws_security_group_rule" "cpc_batch_egress_cpc_db" {
  description              = "Allow TCP/1521 to CPC DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${module.cpc-batch.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.cpc.cpc-db-sg-id}"
}

resource "aws_security_group_rule" "cpc_batch_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = "${module.cpc-batch.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.base.kms_sg_id}"
}

resource "aws_security_group_rule" "active_mq_ingress_cpc_batch" {
  description              = "Allow TCP/61617 from CPC Batch"
  type                     = "ingress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.awsmq_sg_id}"
  source_security_group_id = "${module.cpc-batch.security_group_id}"
}

resource "aws_security_group_rule" "cpc_batch_egress_active_mq" {
  description              = "Allow TCP/61617 to AWS MQ"
  type                     = "egress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = "${module.cpc-batch.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.base.awsmq_sg_id}"
}

# Rule to permit access to EFS Mount Targets from CPC Batch
resource "aws_security_group_rule" "cpc_batch_egress_cpc_batch_efs" {
  type                     = "egress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${module.cpc-batch.security_group_id}"
  source_security_group_id = "${aws_security_group.cpc_batch_efs.id}"
}

resource "aws_security_group_rule" "cpc_batch_efs_ingress_cpc_batch_nfs" {
  type                     = "ingress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc_batch_efs.id}"
  source_security_group_id = "${module.cpc-batch.security_group_id}"
}