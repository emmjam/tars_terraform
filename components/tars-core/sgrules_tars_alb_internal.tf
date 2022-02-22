resource "aws_security_group_rule" "tars_alb_internal_ingress_apache" {
  description              = "Allow TCP/803 from Apache"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-internal.id
  source_security_group_id = module.apache.security_group_id
}

resource "aws_security_group_rule" "tars_alb_public_ingress_alb" {
  # Will replace Apache rule above  - IanD
  description              = "Allow TCP/80 from Public ALB"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.apache_alb_internal.id
  source_security_group_id = module.apache.security_group_id
}

resource "aws_security_group_rule" "tars_alb_public_egress_tars_front_port_8443" {
  description              = "Allow TCP/8443 to tars core frontend"
  type                     = "egress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-internal.id
  source_security_group_id = module.tars_front.security_group_id
}

resource "aws_security_group_rule" "tars_alb_public_egress_irdt_front_port_7443_irdt" {
  description              = "Allow TCP/7443 to irdt core frontend"
  type                     = "egress"
  from_port                = 7443
  to_port                  = 7443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-alb-internal.id
  source_security_group_id = module.tars_front.security_group_id
}

