resource "aws_security_group_rule" "batch_egress_xenco" {
  description       = "TARS Batch to Xenco Service NLB"
  type              = "egress"
  from_port         = "16385"
  to_port           = "16385"
  protocol          = "tcp"
  security_group_id = "${data.terraform_remote_state.tars-core.tars-batch-sg-id}"

  cidr_blocks = [
    "${var.xenco_lb_subnets_cidrs}",
  ]
}

