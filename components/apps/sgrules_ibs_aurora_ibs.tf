# ibs to rds DB
resource "aws_security_group_rule" "aurora_db_ingress_ibs" {
  description              = "Allow TCP/3306 from IBS"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ibs_aurora.id
  source_security_group_id = module.ibs.security_group_id
}

resource "aws_security_group_rule" "aurora_db_ingress_bastion" {
  description              = "Allow TCP/3306 from bastion"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ibs_aurora.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
}

