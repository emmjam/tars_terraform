# jenkinsnode to rds DB
resource "aws_security_group_rule" "jenkinsnode_egress_mis_rds" {
  description              = "Allow TCP/1521 to RDS"
  type                     = "egress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.jenkinsnode_sg_id}"
  source_security_group_id = "${aws_security_group.tars-mis-db.id}"
}

# jenkinsnode to rds DB
resource "aws_security_group_rule" "jenkinsnode_egress_rsis_rds" {
  description              = "Allow TCP/1521 to RDS"
  type                     = "egress"
  from_port                = "1521"
  to_port                  = "1521"
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.jenkinsnode_sg_id}"
  source_security_group_id = "${aws_security_group.tars-rsis-db.id}"
}
