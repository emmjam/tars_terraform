# cpc to rds DB
resource "aws_security_group_rule" "oracle_db_ingress_cpc" {
  description              = "Allow TCP/1521 from CPC"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cpc-db.id
  source_security_group_id = module.cpc-back.security_group_id
}

# rds DB from jenkinsnode
resource "aws_security_group_rule" "oracle_db_ingress_jenkinsnode" {
  description              = "Allow TCP/1521 from jenkinsnode"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cpc-db.id
  source_security_group_id = data.terraform_remote_state.base.outputs.jenkinsnode_sg_id
}

# bastion to rds DB
resource "aws_security_group_rule" "oracle_db_ingress_bastion" {
  description              = "Allow TCP/1521 from Bastion"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cpc-db.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_outbound-oracle_sg_id
}

# prometheus to rds DB
resource "aws_security_group_rule" "oracle_db_ingress_prometheus" {
  description              = "Allow TCP/1521 from Prometheus to RDS"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cpc-db.id
  source_security_group_id = data.terraform_remote_state.base.outputs.prometheus_sg_id
}

resource "aws_security_group_rule" "tars_batch_ingress_cpc_db" {
  description              = "Allow TCP/1521 from TARS Batch"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cpc-db.id
  source_security_group_id = data.terraform_remote_state.tars-batch.outputs.tars-batch-sg-id
}

resource "aws_security_group_rule" "oracle_db_ingress_jemkinsctrl" {
  description              = "Allow TCP/1521 from Jenkinsctrl"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cpc-db.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
}

resource "aws_security_group_rule" "oracle_db_ingress_tars" {
  count                    = contains(var.rds_tars_cpc_rule_env, var.environment) ? 1 : 0
  description              = "Allow TCP/1521 from tarsdb to RDS"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cpc-db.id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-apache-sg-id
}

resource "aws_security_group_rule" "oracle_db_egress_tars" {
  count                    = contains(var.rds_tars_cpc_rule_env, var.environment) ? 1 : 0
  description              = "Allow TCP/1521 from RDS to tarsdb"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cpc-db.id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-apache-sg-id
}