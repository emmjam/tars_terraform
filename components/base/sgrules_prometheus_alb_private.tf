resource "aws_security_group_rule" "prometheus-alb-private-ingress-core" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 9090
  to_port                  = 9090
  security_group_id        = "${aws_security_group.prometheus-alb-private.id}"
  source_security_group_id = "${aws_security_group.core.id}"
}

#Add grafana ingress when implemented.
resource "aws_security_group_rule" "prometheus-alb-private-ingress-grafana" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 9090
  to_port                  = 9090
  security_group_id        = "${aws_security_group.prometheus-alb-private.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.grafana_sg_id}"
}

resource "aws_security_group_rule" "prometheus-alb-private-egress-prometheus" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 9090
  to_port                  = 9090
  security_group_id        = "${aws_security_group.prometheus-alb-private.id}"
  source_security_group_id = "${aws_security_group.prometheus.id}"
}

#Add egress from grafana to this ALB
resource "aws_security_group_rule" "grafana-egress-prometheus-private-alb" {
  description       = "Allow egress to prometheus"
  type              = "egress"
  from_port         = 9090
  to_port           = 9090
  protocol          = "tcp"
  security_group_id = "${data.terraform_remote_state.ctrl.grafana_sg_id}"
  source_security_group_id = "${aws_security_group.prometheus-alb-private.id}"
}
