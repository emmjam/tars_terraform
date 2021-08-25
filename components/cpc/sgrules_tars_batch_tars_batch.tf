resource "aws_security_group_rule" "tars_batch_egress_cpc_back" {
  description              = "Allow TCP/8080 to cpc back ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-batch-sg-id}"
  source_security_group_id = "${aws_security_group.cpc-back-alb.id}"
}

resource "aws_security_group_rule" "tars_batch_egress_cpc_db" {
  description              = "Allow TCP/1521 to cpc DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-batch-sg-id}"
  source_security_group_id = "${aws_security_group.cpc-db.id}"
}

