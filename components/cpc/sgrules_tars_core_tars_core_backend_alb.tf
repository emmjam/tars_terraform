resource "aws_security_group_rule" "tars-back-alb-ingress-cpc-front-8080" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
  source_security_group_id = module.cpc-front.security_group_id
}

resource "aws_security_group_rule" "tars_back_alb_ingress_cpc_back" {
  description              = "Allow TCP/8080 from CPC back"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
  source_security_group_id = module.cpc-back.security_group_id
}
