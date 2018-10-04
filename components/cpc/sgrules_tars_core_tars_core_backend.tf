resource "aws_security_group_rule" "tars_back_egress_cpc_back_alb" {
  description              = "Allow TCP/8080 to CPC back ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-backend-sg-id}"
  source_security_group_id = "${aws_security_group.cpc-back-alb.id}"
}
