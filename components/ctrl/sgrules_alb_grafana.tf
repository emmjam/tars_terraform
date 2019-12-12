# Grafana ALB
resource "aws_security_group_rule" "grafana_alb_ingress_whitelist_https" {
  description       = "Allow HTTPS from whitelisted IP addresses"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.grafana_alb.id

  cidr_blocks = var.whitelist
}

resource "aws_security_group_rule" "grafana_egress_grafana_alb_http" {
  description              = "Allow HTTP from Grafana ALB to Grafana"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.grafana_alb.id
  source_security_group_id = module.grafana.security_group_id
}

