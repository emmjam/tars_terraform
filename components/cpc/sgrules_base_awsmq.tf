resource "aws_security_group_rule" "active_mq_ingress_cpc_back" {
  description              = "Allow TCP/61617 from CPC Back"
  type                     = "ingress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.awsmq_sg_id}"
  source_security_group_id = "${module.cpc-back.security_group_id}"
}

resource "aws_security_group_rule" "active_mq_ingress_cpc_batch" {
  description              = "Allow TCP/61617 from CPC Batch"
  type                     = "ingress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.awsmq_sg_id}"
  source_security_group_id = "${module.cpc_batch.security_group_id}"
}

