resource "aws_security_group_rule" "cpc_batch_egress_cpc_db" {
  description              = "Allow TCP/1521 to CPC DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc_batch.id}"
  source_security_group_id = "${data.terraform_remote_state.cpc.cpc-db-sg-id}"
}

resource "aws_security_group_rule" "cpc_batch_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.cpc_batch.id}"
  source_security_group_id = "${data.terraform_remote_state.base.kms_sg_id}"
}

resource "aws_security_group_rule" "cpc_batch_egress_active_mq" {
  description              = "Allow TCP/61617 to AWS MQ"
  type                     = "egress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc_batch.id}"
  source_security_group_id = "${data.terraform_remote_state.base.awsmq_sg_id}"
}

# Rule to permit access to EFS Mount Targets from CPC Batch
resource "aws_security_group_rule" "cpc_batch_egress_cpc_batch_efs" {
  type                     = "egress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc_batch.id}"
  source_security_group_id = "${aws_security_group.cpc_batch_efs.id}"
}

resource "aws_security_group_rule" "cpc_batch_egress_tars_back_alb" {
  description              = "Allow TCP/8080 to TARS back ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc_batch.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
}

resource "aws_security_group_rule" "cpc_egress_sftpplus_nlb" {
  description       = "Allow TCP/15021 from SFTPPlus to CPC Batch"
  type              = "egress"
  from_port         = "15021"
  to_port           = "15021"
  protocol          = "tcp"
  security_group_id = "${aws_security_group.cpc_batch.id}"

  cidr_blocks = [
    "${var.cpc_sftp_subnets_cidrs}",
  ]
}

resource "aws_security_group_rule" "cpc_batch_egress_dvla_elise" {
  description       = "Allow TCP/443 to DVLA Elise"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.cpc_batch.id}"

  cidr_blocks = [
    "${var.dvla_elise_server}",
  ]
}

