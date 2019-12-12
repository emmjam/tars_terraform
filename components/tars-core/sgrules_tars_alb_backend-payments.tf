resource "aws_security_group_rule" "tars_alb_payments_egress_tars_backend_port_8080" {
  description              = "Allow TCP/8080 from payments ALB to tars core backend"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-backend-payments.id
  source_security_group_id = module.tars_back.security_group_id
}

resource "aws_security_group_rule" "tars_alb_payments_ingress_whitelist_port_443" {
  description       = "Allow TCP/443 from payments whitelist"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.tars-alb-backend-payments.id

  cidr_blocks = var.payments_whitelist
}

resource "aws_security_group_rule" "tars_alb_payments_ingress_jmeter_port_443" {
  description              = "Allow TCP/443 from JMeter"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-backend-payments.id
  source_security_group_id = data.terraform_remote_state.base.outputs.jmeter_sg_id
}

