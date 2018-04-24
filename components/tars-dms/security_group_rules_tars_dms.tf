# DMS rules
# Rules for tars core db
resource "aws_security_group_rule" "tars_dms_instance_ingress_tars_core_db" {
  description              = "Allow TCP/1521 from tars core db"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-dms.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
}

resource "aws_security_group_rule" "tars_dms_instance_egress_tars_core_db" {
  description              = "Allow TCP/1521 to tars core db"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-dms.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
}

resource "aws_security_group_rule" "tars_core_db_ingress_tars_dms_instance" {
  description              = "Allow TCP/1521 from tars dms instance"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
  source_security_group_id = "${aws_security_group.tars-dms.id}"
}

resource "aws_security_group_rule" "tars_core_db_egress_tars_dms_instance" {
  description              = "Allow TCP/1521 to tars dms instance"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
  source_security_group_id = "${aws_security_group.tars-dms.id}"
}

# Add more rules for other db instances
