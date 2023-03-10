# TARS backend to mock ALB
resource "aws_security_group_rule" "cpc_batch_egress_tars_alb_mock_port_8080" {
  description              = "Allow TCP/8080 to TARS mock ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.cpc-batch.outputs.cpc-batch-sg-id
  source_security_group_id = aws_security_group.tars-alb-mock.id
}

