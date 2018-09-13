resource "aws_security_group_rule" "fyndi_alb_internal_egress_jmeter_port_443" {
  description       = "Allow TCP/443 from Internet"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id = "${aws_security_group.fyndi_internal-alb.id}"
  security_group_id = "${data.terraform_remote_state.base.jmeter_sg_id}"
}

resource "aws_security_group_rule" "fyndi_internal-alb_ingress_public" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "443"
  to_port                  = "443"
  security_group_id        = "${aws_security_group.fyndi_internal-alb.id}"
  source_security_group_id = "${data.terraform_remote_state.base.jmeter_sg_id}"
}

resource "aws_security_group_rule" "fyndi_internal-alb_egress_fyndi" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${aws_security_group.fyndi_internal-alb.id}"
  source_security_group_id = "${aws_security_group.fyndi-f.id}"
}

