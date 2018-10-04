resource "aws_security_group_rule" "cpc-front-alb_ingress_dvsa-internet-443" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = "${aws_security_group.cpc-front-dvsa-internet-alb.id}"

  # Needs changing to be generic internet when we're ready
  cidr_blocks = [
    "${var.whitelist}",
  ]
}

resource "aws_security_group_rule" "cpc-front-alb_egress_cpc-front-dvsa-internet-8443" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "8443"
  to_port                  = "8443"
  security_group_id        = "${aws_security_group.cpc-front-dvsa-internet-alb.id}"
  source_security_group_id = "${module.cpc-front.security_group_id}"
}
