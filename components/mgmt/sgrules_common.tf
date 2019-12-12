# common
resource "aws_security_group_rule" "common_ingress_bastion_ssh" {
  description              = "Allow TCP/22 from Bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.common.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
}

