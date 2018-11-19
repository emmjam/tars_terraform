# jenkinsnode to windows messaging to support code/config deployments (SSH)
resource "aws_security_group_rule" "jenkinsnode_egress_win_msg_ssh" {
  description              = "Allow TCP/22 to Windows Messaging"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "22"
  to_port                  = "22"
  security_group_id        = "${data.terraform_remote_state.base.jenkinsnode_sg_id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}

# jenkinsnode to windows messaging to support code/config deployments (Wildfly Admin)
resource "aws_security_group_rule" "jenkinsnode_egress_win_msg_wildfly" {
  description              = "Allow TCP/9990 to Windows Messaging"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "9990"
  to_port                  = "9990"
  security_group_id        = "${data.terraform_remote_state.base.jenkinsnode_sg_id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}