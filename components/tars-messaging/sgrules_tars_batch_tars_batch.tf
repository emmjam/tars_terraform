resource "aws_security_group_rule" "tars_batch_egress_tars_alb_messaging_port_8080" {
  description              = "Allow TCP/8080 to tars messaging ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-batch-sg-id}"
  source_security_group_id = "${aws_security_group.tars-alb-messaging.id}"
}
