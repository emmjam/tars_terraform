# Oracle DB rules
resource "aws_security_group_rule" "oracle_db_ingress_tars_backend" {
  description              = "Allow TCP/1521 from tars core backend"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-core-db.id
  source_security_group_id = module.tars_back.security_group_id
}

resource "aws_security_group_rule" "oracle_db_ingress_tars_frontend" {
  description              = "Allow TCP/1521 from tars core frontend"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-core-db.id
  source_security_group_id = module.tars_front.security_group_id
}

/*# rds DB from jenkinsnode
resource "aws_security_group_rule" "oracle_db_ingress_jenkinsnode" {
  description              = "Allow TCP/1521 from jenkinsnode"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-core-db.id
  source_security_group_id = data.terraform_remote_state.base.outputs.jenkinsnode_sg_id
}
*/

# bastion to rds DB
resource "aws_security_group_rule" "oracle_db_ingress_bastion" {
  description              = "Allow TCP/1521 from Bastion"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-core-db.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_outbound-oracle_sg_id
}

resource "aws_security_group_rule" "oracle_db_ingress_prometheus" {
  description              = "Allow TCP/1521 from Prometheus to RDS"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-core-db.id
  source_security_group_id = data.terraform_remote_state.base.outputs.prometheus_sg_id
}

resource "aws_security_group_rule" "oracle_db_ingress_jemkinsctrl" {
  description              = "Allow TCP/1521 from Jenkinsctrl"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-core-db.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
}
