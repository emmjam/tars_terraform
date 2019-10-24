
resource "aws_security_group_rule" "tars_back_alb_ingress_cpc_batch" {
  description              = "Allow TCP/8080 from CPC batch"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
  source_security_group_id = "${module.cpc_batch.security_group_id}"
}
