resource "aws_security_group_rule" "bastion_elb_ingress_whitelist_ssh" {
  description       = "Allow TCP/22 from whitelisted IP addresses"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.bastion_elb.id

  cidr_blocks = var.whitelist
}

resource "aws_security_group_rule" "bastion_elb_egress_bastion" {
  description              = "Allow TCP/22 to Bastion"
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.bastion_elb.id
  source_security_group_id = module.bastion.security_group_id
}

