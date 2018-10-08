# TARS private facing alb rules
resource "aws_security_group_rule" "tars_alb_private_ingress_whitelist_port_443" {
  description              = "Allow TCP/443 from Internet"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-private.id}"
  source_security_group_id = "${data.terraform_remote_state.base.jmeter_sg_id}"
}

resource "aws_security_group_rule" "tars_alb_private_ingress_dvsa_port_443" {
  description       = "Allow TCP/443 from Internet"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-alb-private.id}"

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "tars_alb_private_egress_tars_front_port_8443" {
  description              = "Allow TCP/8443 to tars core frontend"
  type                     = "egress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-private.id}"
  source_security_group_id = "${aws_security_group.tars-core-frontend.id}"
}
