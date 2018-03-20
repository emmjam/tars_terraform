# TARS Core batch rules
resource "aws_security_group_rule" "tars_core_batch_ingress_private_alb_port_8080" {
  description              = "Allow TCP/8080 from batch private ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-core-batch.id}"
  source_security_group_id = "${aws_security_group.tars-alb-batch.id}"
}

resource "aws_security_group_rule" "tars_core_batch_egress_oracle_db" {
  description              = "Allow TCP/1521 to the Oracle DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-core-batch.id}"
  source_security_group_id = "${data.terraform_remote_state.tars.tars-core-db-sg-id}"
}

resource "aws_security_group_rule" "tars_core_backendend_ingress_bastion" {
  count                    = "${length(var.mgmt_bastion_subnets)}"
  description              = "Allow TCP/22 from bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-core-batch.id}"
  cidr_blocks              = ["${element(var.mgmt_bastion_subnets,count.index)}"]
}

resource "aws_security_group_rule" "tars_core_batch_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.tars-core-batch.id}"
  source_security_group_id = "${data.terraform_remote_state.base.kms_sg_id}"
}