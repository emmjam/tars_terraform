# TARS Private ALB batch rules
resource "aws_security_group_rule" "tars_alb_batch_ingress_tars_frontend_port_8080" {
  description              = "Allow TCP/8080 from tars core frontend"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-batch.id}"
  source_security_group_id = "${data.terraform_remote_state.tars.tars-core-frontend-sg-id}"
}

resource "aws_security_group_rule" "tars_alb_batch_egress_tars_batch_port_8080" {
  description              = "Allow TCP/8080 to tars core batch"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-batch.id}"
  source_security_group_id = "${aws_security_group.tars-core-batch.id}"
}
