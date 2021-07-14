resource "aws_security_group_rule" "oraclexe_ingress_bastion_ssh" {
  count                    = var.account_environment != "mgmt" ? 1 : 0
  description              = "Allow TCP/22 from Bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.oraclexe[count.index].id
  source_security_group_id = module.bastion.security_group_id
}

resource "aws_security_group_rule" "oraclexe_ingress_grafana_alb_http" {
  count                    = var.account_environment != "mgmt" ? 1 : 0
  description              = "Allow TCP from Grafana ALB"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.oraclexe[count.index].id
  source_security_group_id = aws_security_group.grafana_alb.id
}

