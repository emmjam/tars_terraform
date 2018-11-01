# DMS rules
# Generic rules for the dms replication instance, and to be attached to the source/target dbs
resource "aws_security_group_rule" "tars_dms_ingress_1521" {
  description       = "Allow TCP/1521 inbound"
  type              = "ingress"
  from_port         = 1521
  to_port           = 1521
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-dms.id}"
  self              = true
}

resource "aws_security_group_rule" "tars_dms_egress_1521" {
  description       = "Allow TCP/1521 outbound"
  type              = "egress"
  from_port         = 1521
  to_port           = 1521
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-dms.id}"
  self              = true
}

resource "aws_security_group_rule" "tars_dms_egress_capita_db" {
  description       = "Allow TCP/6720-6722 to Capita on-premise DB"
  type              = "egress"
  from_port         = "${var.capita_db_from_port}"
  to_port           = "${var.capita_db_to_port}"
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-dms.id}"

  cidr_blocks = [
    "${var.capita_db_subnets}",
  ]
}

resource "aws_security_group_rule" "tars_dms_ingress_XE" {
  description              = "Allow TCP/1521 from XE instance"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-dms.id}"
  source_security_group_id = "${aws_security_group.oraclexe.id}"
}

resource "aws_security_group_rule" "dms_egress_tars_rds_1521" {
  description              = "Allow TCP/1521 outbound to tars RDS"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-dms.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
}

resource "aws_security_group_rule" "dms_egress_cpc_rds_1521" {
  description              = "Allow TCP/1521 outbound to cpc RDS"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-dms.id}"
  source_security_group_id = "${data.terraform_remote_state.cpc.cpc-db-sg-id}"
}

resource "aws_security_group_rule" "dms_egress_mis_rds_1521" {
  description              = "Allow TCP/1521 outbound to mis RDS"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-dms.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-reporting.mis-db-sg-id}"
}

resource "aws_security_group_rule" "dms_egress_rsis_rds_1521" {
  description              = "Allow TCP/1521 outbound to rsis RDS"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-dms.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-reporting.rsis-db-sg-id}"
}

resource "aws_security_group_rule" "tars_dms_oem_ingress_XE" {
  description              = "Allow TCP/5500 from XE"
  type                     = "ingress"
  from_port                = 5500
  to_port                  = 5500
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-dms.id}"
  source_security_group_id = "${aws_security_group.oraclexe.id}"
}
