# TARS Core batch rules
resource "aws_security_group_rule" "tars_batch_ingress_private_alb_port_8080" {
  description              = "Allow TCP/8080 from batch private ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.tars_batch.security_group_id
  source_security_group_id = aws_security_group.tars-alb-batch.id
}

resource "aws_security_group_rule" "tars_batch_egress_oracle_db" {
  description              = "Allow TCP/1521 to the Oracle DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = module.tars_batch.security_group_id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
}

resource "aws_security_group_rule" "tars_batch_ingress_bastion" {
  description              = "Allow TCP/22 from bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.tars_batch.security_group_id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
}

resource "aws_security_group_rule" "tars_batch_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = module.tars_batch.security_group_id
  source_security_group_id = data.terraform_remote_state.base.outputs.kms_sg_id
}

resource "aws_security_group_rule" "tars_batch_egress_active_mq" {
  description              = "Allow TCP/61617 to AWS MQ"
  type                     = "egress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = module.tars_batch.security_group_id
  source_security_group_id = data.terraform_remote_state.base.outputs.awsmq_sg_id
}

resource "aws_security_group_rule" "batch_egress_batch_efs_nfs" {
  type                     = "egress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = module.tars_batch.security_group_id
  source_security_group_id = aws_security_group.batch_efs.id
}

resource "aws_security_group_rule" "tars_batch_egress_avarto_sftp" {
  description       = "Allow TCP/22 to AVARTO"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.tars_batch.security_group_id

  cidr_blocks = [
    var.avarto_sftp_server,
  ]
}

resource "aws_security_group_rule" "tars_batch_egress_avarto_aws_sftp" {
  description       = "Allow TCP/22 to AVARTO AWS"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.tars_batch.security_group_id

  cidr_blocks = [
    var.avarto_aws_sftp_server,
  ]
}

# TODO: peacheym: Seems too wide. Should allow explicit requirements
resource "aws_security_group_rule" "tars_batch_egress_sweda_sftp" {
  description       = "Allow ALL to Sweda Samba"
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = "-1"
  security_group_id = module.tars_batch.security_group_id

  cidr_blocks = [
    var.sweda_samba_server,
  ]
}

resource "aws_security_group_rule" "tars_batch_egress_dvla_adli" {
  description       = "Allow TCP/22 to DVLA ADLI"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.tars_batch.security_group_id

  cidr_blocks = [
    var.dvla_adli_server,
  ]
}

resource "aws_security_group_rule" "tars_batch_egress_rsis_sftp" {
  description       = "Allow ALL to RSIS Samba"
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = "-1"
  security_group_id = module.tars_batch.security_group_id

  cidr_blocks = [
    var.rsis_samba_server,
    var.rsis_samba_server_archive,
  ]
}

resource "aws_security_group_rule" "tars_batch_egress_dvla_ldap" {
  description       = "Allow TCP/389 to DVLA LDAP"
  type              = "egress"
  from_port         = 389
  to_port           = 389
  protocol          = "tcp"
  security_group_id = module.tars_batch.security_group_id

  cidr_blocks = [
    var.dvsa_ldap_server,
  ]
}

resource "aws_security_group_rule" "tars_batch_egress_dvsa_dns" {
  description       = "Allow DNS to DVSA DNS"
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = "-1"
  security_group_id = module.tars_batch.security_group_id

  cidr_blocks = var.dvsa_dns_servers
}


resource "aws_security_group_rule" "squidnat_ingress_batch_ftts_elig" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "22"
  to_port                  = "22"
  security_group_id        = data.terraform_remote_state.base.outputs.squidnat_sg_id
  source_security_group_id = module.tars_batch.security_group_id
}

resource "aws_security_group_rule" "batch_egress_squidnat_ftts_elig" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "22"
  to_port                  = "22"
  security_group_id        = module.tars_batch.security_group_id
  source_security_group_id = data.terraform_remote_state.base.outputs.squidnat_sg_id
}
