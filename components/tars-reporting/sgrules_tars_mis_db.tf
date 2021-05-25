# Oracle DB rules

resource "aws_security_group_rule" "mis_rds_ingress_dvsa-1521" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = "1521"
  to_port           = "1521"
  security_group_id = aws_security_group.tars-mis-db.id

  cidr_blocks = [
    "10.0.0.0/8",
  ]
}

# bastion to rds DB
resource "aws_security_group_rule" "mis_rds_ingress_bastion" {
  description              = "Allow TCP/1521 from Bastion"
  type                     = "ingress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mis-db.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_outbound-oracle_sg_id
}

# MIS DB to TARS DB (MV pull)
resource "aws_security_group_rule" "mis_rds_egress_tarsdb_sg" {
  description              = "Allow TCP/1521 from MISDB"
  type                     = "egress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mis-db.id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
}

# TARS to MIS DB
resource "aws_security_group_rule" "mis_rds_ingress_tarsdb_sg" {
  description              = "Allow TCP/1521 from TARSDB"
  type                     = "ingress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mis-db.id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
}

# MIS to tars backend for PAN encryption
resource "aws_security_group_rule" "oracle_mis_egress_tars_backend" {
  description              = "Allow TCP/8080 from MISDB to TARS BACKEND"
  type                     = "egress"
  from_port                = "8080"
  to_port                  = "8080"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mis-db.id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
}

# prometheus to MIS
resource "aws_security_group_rule" "oracle_mis_ingress_prometheus" {
  description              = "Allow TCP/1521 from Prometheus to MISDB"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mis-db.id
  source_security_group_id = data.terraform_remote_state.base.outputs.prometheus_sg_id
}

# TARS BATCH to MIS DB
resource "aws_security_group_rule" "mis_rds_ingress_tars_batch_sg" {
  description              = "Allow TCP/1521 from tars-batch"
  type                     = "ingress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mis-db.id
  source_security_group_id = data.terraform_remote_state.tars-batch.outputs.tars-batch-sg-id
}

# MIS to CPC
resource "aws_security_group_rule" "mis_rds_egress_cpc_rds_sg" {
  description              = "Allow TCP/1521 to CPC DB"
  type                     = "egress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mis-db.id
  source_security_group_id = data.terraform_remote_state.cpc.outputs.cpc-db-sg-id
}

resource "aws_security_group_rule" "mis_oracle_db_ingress_jemkinsctrl" {
  description              = "Allow TCP/1521 from Jenkinsctrl"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mis-db.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
}

# Power BI to MIS
resource "aws_security_group_rule" "mis_rds_ingress_power_bi" {
  description              = "Allow TCP/2484 from power_bi"
  type                     = "ingress"
  from_port                = "2484"
  to_port                  = "2484"
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mis-db.id
  
  cidr_blocks = [
    var.power_bi_cidr,
  ]
}
