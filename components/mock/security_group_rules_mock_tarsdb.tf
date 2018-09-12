# TARS Mock TARS DB SG Rules
resource "aws_security_group_rule" "tars_db_mock_ingress_port_1521" {
  description = "Allow TCP/1521 from Mock"
  type = "ingress"
  from_port = 1521
  to_port = 1521
  protocol = "tcp"
  security_group_id = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
  source_security_group_id = "${aws_security_group.tars-mock.id}"
}

resource "aws_security_group_rule" "mock_tars_db_egress_port_1521" {
  description              = "Allow TCP/1521 to tars DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-mock.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
}



