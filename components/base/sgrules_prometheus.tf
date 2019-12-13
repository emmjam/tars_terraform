resource "aws_security_group_rule" "prometheus-private-alb-prometheus" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 9090
  to_port                  = 9090
  security_group_id        = module.prometheus.security_group_id
  source_security_group_id = aws_security_group.prometheus-alb-private.id
}

resource "aws_security_group_rule" "prometheus-egress-core" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 9100
  to_port                  = 9200
  security_group_id        = module.prometheus.security_group_id
  source_security_group_id = aws_security_group.core.id
}

resource "aws_security_group_rule" "prometheus_egress_prometheus_efs" {
  type                     = "egress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  security_group_id        = module.prometheus.security_group_id
  source_security_group_id = aws_security_group.prometheus-efs.id
}

