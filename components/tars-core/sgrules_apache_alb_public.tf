resource "aws_security_group_rule" "apache-alb-public-ingress-whitelist" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  security_group_id = aws_security_group.apache_alb_public.id

  cidr_blocks = var.whitelist
}

resource "aws_security_group_rule" "apache-alb-public-egress-apache" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 80
  to_port                  = 80
  security_group_id        = aws_security_group.apache_alb_public.id
  source_security_group_id = module.apache.security_group_id
}

