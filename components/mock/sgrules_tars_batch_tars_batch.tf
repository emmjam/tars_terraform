resource "aws_security_group_rule" "mock_tars_batch_egress_port_22" {
  description       = "Allow TCP/22 from tars batch"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${data.terraform_remote_state.tars-batch.tars-batch-sg-id}"

  cidr_blocks = [
    "${data.terraform_remote_state.base.subnet_cidrs_tars_backend}",
  ]
}
