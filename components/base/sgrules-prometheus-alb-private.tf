resource "aws_security_group_rule" "prometheus-alb-ingress-core" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 9090
  to_port                  = 9090
  security_group_id        = "${aws_security_group.prometheus-alb-private.id}"
  source_security_group_id = "${aws_security_group.core.id}"
}

#Add grafana ingress when implemented.
resource "aws_security_group_rule" "prometheus-alb-ingress-grafana" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 9090
  to_port                  = 9090
  security_group_id        = "${data.terraform_remote_state.ctrl.grafana_sg_id}"
  source_security_group_id = "${aws_security_group.core.id}"
}