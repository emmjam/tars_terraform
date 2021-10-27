resource "aws_security_group_rule" "mock_tars_batch_egress_port_22" {
  description       = "Allow TCP/22 from tars batch"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = data.terraform_remote_state.tars-batch.outputs.tars-batch-sg-id

  cidr_blocks = data.terraform_remote_state.base.outputs.subnet_cidrs_tars_backend
}

# TARS batch to mock ALB
resource "aws_security_group_rule" "tars_batch_egress_tars_alb_mock_port_8080" {
  description              = "Allow TCP/8080 to TARS mock ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-batch.outputs.tars-batch-sg-id
  source_security_group_id = aws_security_group.tars-alb-mock.id
}


# TARS batch to mock d90
resource "aws_security_group_rule" "tars_back_egress_tars_mock_port_10001_batch" {
  description              = "Allow TCP/10001 to TARS mock D90"
  type                     = "egress"
  from_port                = 10001
  to_port                  = 10001
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-batch.outputs.tars-batch-sg-id
  cidr_blocks = data.terraform_remote_state.base.outputs.subnet_cidrs_tars_backend
}
