#
resource "aws_security_group_rule" "mocksftp_ingress_tars_back" {
  description = "Allow TCP/22 in from NLB for tars back"
  type = "ingress"
  from_port = "22"
  to_port = "22"
  protocol = "tcp"
  security_group_id = "${aws_security_group.tars-mock.id}"
  cidr_blocks = [
    "${data.terraform_remote_state.base.subnet_cidrs_tars_backend}"]
}

resource "aws_security_group_rule" "mock_tars_back_egress_port_22" {
  description              = "Allow TCP/22 from tars back"
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-backend-sg-id}"
  source_security_group_id = "${aws_security_group.tars-mock.id}"
}


