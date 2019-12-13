resource "aws_security_group_rule" "prometheus_efs_ingress_prometheus_nfs" {
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  security_group_id        = aws_security_group.prometheus-efs.id
  source_security_group_id = module.prometheus.security_group_id
}

