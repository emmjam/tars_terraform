# TARS backend to batch ALB
resource "aws_security_group_rule" "tars_backend_egress_tars_alb_batch_port_8080" {
  description              = "Allow TCP/8080 to TARS batch ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars.tars-core-backend-sg-id}"
  source_security_group_id = "${aws_security_group.tars-alb-batch.id}"
}
