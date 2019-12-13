#Add egress from grafana to this ALB
resource "aws_security_group_rule" "grafana-egress-prometheus-private-alb" {
  description              = "Allow egress to prometheus"
  type                     = "egress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.ctrl.outputs.grafana_sg_id
  source_security_group_id = aws_security_group.prometheus-alb-private.id
}

