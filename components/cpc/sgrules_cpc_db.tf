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

resource "aws_security_group_rule" "cpc_db_ingress_cpc_batch" {
  description              = "Allow TCP/1521 from CPC Batch"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.cpc-db.id
  source_security_group_id = module.cpc_batch.security_group_id
}

