# ibs to rds DB
# TODO - Replace with Aurora!!!!
resource "aws_security_group_rule" "oracle_db_ingress_ibs" {
  description              = "Allow TCP/1521 from IBS"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
  source_security_group_id = "${aws_security_group.ibs.id}"
}

