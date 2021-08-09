resource "aws_security_group_rule" "tars_alb_private_egress_whitelist_port_443" {
  description              = "Allow TCP/443 from Internet"
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.base.outputs.jmeter_sg_id
  source_security_group_id = aws_security_group.tars-alb-private.id
}

resource "aws_security_group_rule" "jmeter_egress_api_8443" {
  description              = "Allow TCP/8443 to API"
  type                     = "egress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.base.outputs.jmeter_sg_id
  source_security_group_id = aws_security_group.tars-alb-backend-api.id
}

resource "aws_security_group_rule" "jmeter_egress_backend_alb_8080" {
  description              = "Allow TCP/8080 to backend ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.base.outputs.jmeter_sg_id
  source_security_group_id = aws_security_group.tars-alb-backend.id
}
