resource "aws_security_group_rule" "tars_messaging_ingress_bastion" {
  description              = "Allow TCP/22 from bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bobj.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
}

# TODO: peacheym: Too wide. TCP/443
resource "aws_security_group_rule" "tars_messaging_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bobj.id
  source_security_group_id = data.terraform_remote_state.base.outputs.kms_sg_id
}

# Allow RDP in from Bastion
resource "aws_security_group_rule" "tars_messaging_ingress_bastion_RDP" {
  description              = "Allow TCP/3389 from bastion"
  type                     = "ingress"
  from_port                = 3389
  to_port                  = 3389
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bobj.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
}

resource "aws_security_group_rule" "bobj_egress_rsis_db" {
  description              = "Allow TCP/1521 to the Oracle DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bobj.id
  source_security_group_id = aws_security_group.tars-rsis-db.id
}

resource "aws_security_group_rule" "bobj_egress_mis_db" {
  description              = "Allow TCP/1521 to the Oracle DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bobj.id
  source_security_group_id = aws_security_group.tars-mis-db.id
}

resource "aws_security_group_rule" "bobj_ingress_mis_db" {
  description              = "Allow TCP/1521 to the Oracle DB"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bobj.id
  source_security_group_id = aws_security_group.tars-mis-db.id
}

resource "aws_security_group_rule" "bobj_ingress_rsis_db" {
  description              = "Allow TCP/1521 to the Oracle DB"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bobj.id
  source_security_group_id = aws_security_group.tars-rsis-db.id
}

# Allow the messaging nodes to talk to Azure Monitoring Agent servers
resource "aws_security_group_rule" "tars_messaging_egress_internet_443" {
  description       = "Allow TCP/443 to internet"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.bobj.id

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

