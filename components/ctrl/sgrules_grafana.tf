# Grafana
resource "aws_security_group_rule" "grafana_ingress_bastion_ssh" {
  description              = "Allow TCP/22 from Bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${module.grafana.security_group_id}"
  source_security_group_id = "${module.bastion.security_group_id}"
}

resource "aws_security_group_rule" "grafana_ingress_grafana_alb_http" {
  description              = "Allow HTTP from Grafana ALB"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.grafana.id}"
  source_security_group_id = "${aws_security_group.grafana_alb.id}"
}
