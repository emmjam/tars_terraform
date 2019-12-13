resource "aws_security_group_rule" "tars_core_backend_alb_ingres_tars_messaging_8080" {
  description              = "Allow TCP/8080 from messaging to tars core backend ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
  source_security_group_id = aws_security_group.tars-messaging.id
}

