# bastion-rds
resource "aws_security_group_rule" "bastion_egress_mis_rds_sg" {
  description              = "Allow TCP/1521 from Bastion to RDS"
  type                     = "egress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
  source_security_group_id = "${aws_security_group.tars-mis-db.id}"
}

# bastion-rds
resource "aws_security_group_rule" "bastion_egress_rsis_rds_sg" {
  description              = "Allow TCP/1521 from Bastion to RSIS RDS"
  type                     = "egress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
  source_security_group_id = "${aws_security_group.tars-rsis-db.id}"
}
