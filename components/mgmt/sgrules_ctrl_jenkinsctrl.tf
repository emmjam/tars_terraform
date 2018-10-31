resource "aws_security_group_rule" "build_egress_jenkinsctrl_ssh" {
  description              = "Allow SSH out from jenkinsctrl to build instances"
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.ctrl.jenkinsctrl_sg_id}"
  source_security_group_id = "${aws_security_group.build.id}"
}
