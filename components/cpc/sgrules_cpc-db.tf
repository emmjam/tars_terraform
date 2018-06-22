# cpc to rds DB
resource "aws_security_group_rule" "oracle_db_ingress_cpc" {
  description              = "Allow TCP/1521 from CPC"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.cpc-db.id}"
  source_security_group_id = "${module.cpc-back.security_group_id}"
}

