resource "aws_security_group_rule" "bastion_egress_ibs_sg" {
  description              = "Allow TCP/3306 from Bastion to IBS DB"
  type                     = "egress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
  source_security_group_id = "${aws_security_group.ibs_aurora.id}"
}
