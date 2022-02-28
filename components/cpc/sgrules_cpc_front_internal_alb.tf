resource "aws_security_group_rule" "cpc-front-alb_egress_cpc-front-9443" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "9443"
  to_port                  = "9443"
  security_group_id        = aws_security_group.cpc-front-internal-alb.id
  source_security_group_id = module.cpc-front.security_group_id
}

