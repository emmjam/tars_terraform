resource "aws_security_group_rule" "sonarqube_db_ingress_sonarqube_mysql" {
  type                     = "ingress"
  from_port                = "5432"
  to_port                  = "5432"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sonarqube_db.id
  source_security_group_id = module.microservice_sonarqube.security_group_id
}

resource "aws_security_group_rule" "sonarqube_egress_sonarqube_db_mysql" {
  type                     = "egress"
  from_port                = "5432"
  to_port                  = "5432"
  protocol                 = "tcp"
  security_group_id        = module.microservice_sonarqube.security_group_id
  source_security_group_id = aws_security_group.sonarqube_db.id
}

