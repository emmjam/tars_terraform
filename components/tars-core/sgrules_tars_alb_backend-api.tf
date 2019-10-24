# TARS Private ALB backend rules
resource "aws_security_group_rule" "tars_alb_api_egress_tars_backend_port_8080" {
  description              = "Allow TCP/8080 from API ALB to tars core backend"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-backend-api.id}"
  source_security_group_id = "${module.tars_back.security_group_id}"
}

#
resource "aws_security_group_rule" "tars_alb_api_ingress_whitelist_port_8443" {
  description       = "Allow TCP/8443 from MES API"
  count         = "${length(var.mes_api_cidr_block) == 0 ? 0 : 1}"
  type              = "ingress"
  from_port         = 8443
  to_port           = 8443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-alb-backend-api.id}"

  cidr_blocks = [
    "${var.mes_api_cidr_block}"
  ]
}

resource "aws_security_group_rule" "tars_alb_api_ingress_jmeter_port_8443" {
  description              = "Allow TCP/8443 from JMeter"
  type                     = "ingress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-alb-backend-api.id}"
  source_security_group_id = "${data.terraform_remote_state.base.jmeter_sg_id}"
}
