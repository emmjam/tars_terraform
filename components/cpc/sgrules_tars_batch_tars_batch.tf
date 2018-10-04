resource "aws_security_group_rule" "tars_batch_egress_cpc_back" {
  description              = "Allow TCP/8080 to cpc back ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-batch.tars-batch-sg-id}"
  source_security_group_id = "${aws_security_group.cpc-back-alb.id}"
}
