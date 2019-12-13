resource "aws_security_group_rule" "apache-ingress-apache-alb-public" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 80
  to_port                  = 80
  security_group_id        = module.apache.security_group_id
  source_security_group_id = aws_security_group.apache_alb_public.id
}

resource "aws_security_group_rule" "apache-egress-tars-alb-internal" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 80
  to_port                  = 80
  security_group_id        = module.apache.security_group_id
  source_security_group_id = aws_security_group.tars-alb-internal.id
}

