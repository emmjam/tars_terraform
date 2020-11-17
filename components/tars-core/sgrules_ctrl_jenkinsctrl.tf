resource "aws_security_group_rule" "jenkinsnode_egress_oracle_db" {
  description              = "Allow TCP/1521 to RDS"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
  source_security_group_id = aws_security_group.tars-core-db.id
}
