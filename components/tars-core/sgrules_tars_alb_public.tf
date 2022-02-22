# TARS public facing alb rules
resource "aws_security_group_rule" "tars_alb_public_ingress_whitelist_port_443" {
  description       = "Allow TCP/443 from Internet"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.tars-dvsa-public.id

  cidr_blocks = var.whitelist
}

resource "aws_security_group_rule" "tars_alb_dvsa_egress_tars_front_port_8443" {
  description              = "Allow TCP/8443 to tars core frontend"
  type                     = "egress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-dvsa-public.id
  source_security_group_id = module.tars_front.security_group_id
}

resource "aws_security_group_rule" "tars_alb_dvsa_egress_tars_front_port_443" {
  description              = "Allow TCP/443 to tars core frontend LB"
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-dvsa-public.id
  source_security_group_id = module.tars_front.security_group_id
}

resource "aws_security_group_rule" "tars_alb_egress_to_internal_alb" {
  description              = "Allow TCP/80 to tars core internal LB"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-internal.id
  source_security_group_id = module.tars_front.security_group_id
}
