resource "aws_security_group_rule" "tars_alb_private_egress_whitelist_port_443" {
  description       = "Allow TCP/443 from Internet"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id = "${aws_security_group.tars-alb-private.id}"
  security_group_id = "${data.terraform_remote_state.base.jmeter_sg_id}"
}

resource "aws_security_group_rule" "tars_alb_private_egress_whitelist_port_9990" {
  description       = "Allow TCP/9990 from Internet"
  type              = "egress"
  from_port         = 9990
  to_port           = 9990
  protocol          = "tcp"
  source_security_group_id = "${aws_security_group.tars-alb-private.id}"
  security_group_id = "${data.terraform_remote_state.base.jmeter_sg_id}"
}

# TARS private facing alb rules
resource "aws_security_group_rule" "tars_alb_private_ingress_whitelist_port_443" {
  description       = "Allow TCP/443 from Internet"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-alb-private.id}"
  source_security_group_id = "${data.terraform_remote_state.base.jmeter_sg_id}"
}

resource "aws_security_group_rule" "tars_alb_private_ingress_whitelist_port_9990" {
  description       = "Allow TCP/9990 from Internet"
  type              = "ingress"
  from_port         = 9990
  to_port           = 9990
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-alb-private.id}"
  source_security_group_id = "${data.terraform_remote_state.base.jmeter_sg_id}"
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

resource "aws_security_group_rule" "tars_alb_private_egress_tars_front_port_9990" {
  description              = "Allow TCP/9990 to tars core frontend"
  type                     = "egress"
  from_port                = 9990
  to_port                  = 9990
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-private.id}"
  source_security_group_id = "${aws_security_group.tars-core-frontend.id}"
}

