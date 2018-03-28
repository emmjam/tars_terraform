# Oracle DB rules
resource "aws_security_group_rule" "oracle_db_ingress_tars_backend" {
  description              = "Allow TCP/1521 from tars core backend"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-core-db.id}"
  source_security_group_id = "${aws_security_group.tars-core-backend.id}"
}

resource "aws_security_group_rule" "oracle_db_ingress_tars_frontend" {
  description              = "Allow TCP/1521 from tars core frontend"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-core-db.id}"
  source_security_group_id = "${aws_security_group.tars-core-frontend.id}"
}
