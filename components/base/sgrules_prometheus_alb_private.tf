resource "aws_security_group_rule" "prometheus-alb-private-ingress-core" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 9090
  to_port                  = 9090
  security_group_id        = aws_security_group.prometheus-alb-private.id
  source_security_group_id = aws_security_group.core.id
}

#Add grafana ingress when implemented.
resource "aws_security_group_rule" "prometheus-alb-private-ingress-grafana" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 9090
  to_port                  = 9090
  security_group_id        = aws_security_group.prometheus-alb-private.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.grafana_sg_id
}

resource "aws_security_group_rule" "prometheus-alb-private-egress-prometheus" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 9090
  to_port                  = 9090
  security_group_id        = aws_security_group.prometheus-alb-private.id
  source_security_group_id = module.prometheus.security_group_id
}

