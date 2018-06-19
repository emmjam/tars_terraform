# TARS Core batch rules
resource "aws_security_group_rule" "tars_batch_ingress_private_alb_port_8080" {
  description              = "Allow TCP/8080 from batch private ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-batch.id}"
  source_security_group_id = "${aws_security_group.tars-alb-batch.id}"
}

resource "aws_security_group_rule" "tars_batch_egress_oracle_db" {
  description              = "Allow TCP/1521 to the Oracle DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-batch.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
}

resource "aws_security_group_rule" "tars_batch_ingress_bastion" {
  description              = "Allow TCP/22 from bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-batch.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}

resource "aws_security_group_rule" "tars_batch_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.tars-batch.id}"
  source_security_group_id = "${data.terraform_remote_state.base.kms_sg_id}"
}

resource "aws_security_group_rule" "oracle_db_ingress_tars_batch" {
  description              = "Allow TCP/1521 from TARS Batch"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
  source_security_group_id = "${aws_security_group.tars-batch.id}"
}

resource "aws_security_group_rule" "active_mq_ingress_tars_batch" {
  description              = "Allow TCP/61617 from TARS Batch"
  type                     = "ingress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.awsmq_sg_id}"
  source_security_group_id = "${aws_security_group.tars-batch.id}"
}


resource "aws_security_group_rule" "tars_batch_egress_active_mq" {
  description              = "Allow TCP/61617 to AWS MQ"
  type                     = "egress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-batch.id}"
  source_security_group_id = "${data.terraform_remote_state.base.awsmq_sg_id}"
}

resource "aws_security_group_rule" "tars_batch_egress_avarto_sftp" {
  description              = "Allow TCP/22 to AVARTO sftp.sharedservicesarvarto.gsi.gov.uk"
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-batch.id}"
  cidr_blocks              = ["51.231.12.13/32"]
}
