# bastion
resource "aws_security_group_rule" "bastion_ingress_elb" {
  description              = "Allow TCP/22 from Bastion ELB"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.bastion.security_group_id
  source_security_group_id = aws_security_group.bastion_elb.id
}

resource "aws_security_group_rule" "bastion_egress_all_ssh" {
  description       = "Allow TCP/22 to All"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.bastion.security_group_id

  cidr_blocks = [
    "10.0.0.0/8",
  ]
}

