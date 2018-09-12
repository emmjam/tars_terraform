# Both TARS Batch and the NLB are in the TARS backend subnet so we require only one ingress rule
# Otherwise we would require ingress rules for the CIDR blocks of both the NLB (for health checks)
# and TARS Batch
resource "aws_security_group_rule" "mocksftp_ingress_tars_batch" {
  description = "Allow TCP/22 in from NLB for tars batch"
  type = "ingress"
  from_port = "22"
  to_port = "22"
  protocol = "tcp"
  security_group_id = "${aws_security_group.tars-mock.id}"
  cidr_blocks = [
    "${data.terraform_remote_state.base.subnet_cidrs_tars_backend}"]
}

resource "aws_security_group_rule" "mock_tars_batch_egress_port_22" {
  description              = "Allow TCP/22 from tars batch"
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-batch.tars-batch-sg-id}"
  cidr_blocks              = [
    "${data.terraform_remote_state.base.subnet_cidrs_tars_backend}"]
}
