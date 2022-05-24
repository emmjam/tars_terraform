# TARS backend to mock ALB
resource "aws_security_group_rule" "tars_backend_egress_tars_alb_mock_port_8080" {
  description              = "Allow TCP/8080 to TARS mock ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-sg-id
  source_security_group_id = aws_security_group.tars-alb-mock.id
}

# TARS batch to mock d90
resource "aws_security_group_rule" "tars_back_egress_tars_mock_port_10001" {
  description       = "Allow TCP/10001 to TARS mock D90"
  type              = "egress"
  from_port         = 10001
  to_port           = 10001
  protocol          = "tcp"
  security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-sg-id
  cidr_blocks       = data.terraform_remote_state.base.outputs.subnet_cidrs_tars_backend
}
