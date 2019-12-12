# jenkinsnode to windows messaging to support code/config deployments (SSH)
resource "aws_security_group_rule" "jenkinsnode_egress_win_msg_ssh" {
  description              = "Allow TCP/22 to Windows Messaging"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "22"
  to_port                  = "22"
  security_group_id        = data.terraform_remote_state.base.outputs.jenkinsnode_sg_id
  source_security_group_id = aws_security_group.tars-messaging.id
}

