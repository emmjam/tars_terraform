# TARS Private ALB messaging rules
resource "aws_security_group_rule" "tars_alb_messaging_ingress_tars_batch_port_8080" {
  description              = "Allow TCP/8080 from tars batch"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-messaging.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-batch.tars-batch-sg-id}"
}

resource "aws_security_group_rule" "tars_batch_egress_tars_alb_messaging_port_8080" {
  description              = "Allow TCP/8080 to tars messaging ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-batch.tars-batch-sg-id}"
  source_security_group_id = "${aws_security_group.tars-alb-messaging.id}"
}

resource "aws_security_group_rule" "tars_alb_messaging_egress_tars_messaging_port_8080" {
  description              = "Allow TCP/8080 to tars messaging"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-messaging.id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}
