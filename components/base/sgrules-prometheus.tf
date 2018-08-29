resource "aws_security_group_rule" "prometheus-public-alb-http" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 80
  to_port                  = 80
  security_group_id        = "${aws_security_group.prometheus.id}"
  source_security_group_id = "${aws_security_group.prometheus-alb-public.id}"
}

resource "aws_security_group_rule" "prometheus-private-alb-prometheus" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 9090
  to_port                  = 9090
  security_group_id        = "${aws_security_group.prometheus.id}"
  source_security_group_id = "${aws_security_group.prometheus-alb-private.id}"
}

resource "aws_security_group_rule" "prometheus-egress-core" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 9100
  to_port                  = 9200
  security_group_id        = "${aws_security_group.prometheus.id}"
  source_security_group_id = "${aws_security_group.core.id}"
}
