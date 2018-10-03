# ibs to rds DB
resource "aws_security_group_rule" "aurora_db_ingress_ibs" {
  description              = "Allow TCP/3306 from IBS"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.ibs_aurora.id}"
  source_security_group_id = "${aws_security_group.ibs.id}"
}
resource "aws_security_group_rule" "aurora_db_ingress_bastion" {
  description              = "Allow TCP/3306 from bastion"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.ibs_aurora.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}
resource "aws_security_group_rule" "bastion_egress_ibs_sg" {
  description       = "Allow TCP/3306 from Bastion to IBS DB"
  type              = "egress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
  source_security_group_id = "${aws_security_group.ibs_aurora.id}"
}


