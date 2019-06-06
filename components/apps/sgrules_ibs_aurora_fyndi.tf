# fyndi-f to rds DB
resource "aws_security_group_rule" "aurora_db_ingress_fyndi-f" {
  description              = "Allow TCP/3306 from FYNDI Front"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.ibs_aurora.id}"
  source_security_group_id = "${module.fyndi-f.security_group_id}"
}

# fyndi-b to rds DB
resource "aws_security_group_rule" "aurora_db_ingress_fyndi-b" {
  description              = "Allow TCP/3306 from FYNDI Back"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.ibs_aurora.id}"
  source_security_group_id = "${module.fyndi-b.security_group_id}"
}
