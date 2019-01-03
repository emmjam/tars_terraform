# Oracle DB rules
resource "aws_security_group_rule" "rsis_rds_ingress_dvsa-1521" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = "1521"
  to_port           = "1521"
  security_group_id = "${aws_security_group.tars-rsis-db.id}"

  cidr_blocks = [
    "10.0.0.0/8",
  ]
}

# rds DB from jenkinsnode
resource "aws_security_group_rule" "rsis_rds_ingress_jenkinsnode" {
  description              = "Allow TCP/1521 from jenkinsnode"
  type                     = "ingress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-rsis-db.id}"
  source_security_group_id = "${data.terraform_remote_state.base.jenkinsnode_sg_id}"
}

# bastion to rds DB
resource "aws_security_group_rule" "rsis_rds_ingress_bastion" {
  description              = "Allow TCP/1521 from Bastion"
  type                     = "ingress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-rsis-db.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}

# prometheus to RSIS
resource "aws_security_group_rule" "rsis_rds_ingress_prometheus" {
  description               = "Allow TCP/1521 from Prometheus to RSIS"
  type                      = "ingress"
  from_port                 = 1521
  to_port                   = 1521
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.tars-rsis-db.id}"
  source_security_group_id  = "${data.terraform_remote_state.base.prometheus_sg_id}"
}

# RSIS DB to TARS DB
resource "aws_security_group_rule" "rsis_rds_egress_tars_db" {
  description               = "Allow TCP/1521 to TARS DB"
  type                      = "egress"
  from_port                 = 1521
  to_port                   = 1521
  protocol                  = "tcp"
  security_group_id         = "${aws_security_group.tars-rsis-db.id}"
  source_security_group_id  = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
}

# TARS BATCH to RSIS DB
resource "aws_security_group_rule" "rsis_rds_ingress_tars_batch_sg" {
  description              = "Allow TCP/1521 from tars-batch"
  type                     = "ingress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-rsis-db.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-batch-sg-id}"
}