# TARS Messaging A/D rules

# The IP range includes the DVSA/Capita DNS servers no extra rules required.
resource "aws_security_group_rule" "tars_messaging_egress_dvsa_dc" {
  description       = "Allow all TCP/IP to DVSA DC"
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_dc_whitelist}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_sccm_443" {
  description       = "Allow all TCP/443 to DVSA SCCM"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_sccm_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_sccm_1433" {
  description       = "Allow all TCP/1443 to DVSA SCCM"
  type              = "egress"
  from_port         = 1433
  to_port           = 1433
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_sccm_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_sccm_80" {
  description       = "Allow all TCP/80 to DVSA SCCM"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_sccm_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_sccm_445" {
  description       = "Allow all TCP/445 to DVSA SCCM"
  type              = "egress"
  from_port         = 445
  to_port           = 445
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_sccm_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_sccm_3268" {
  description       = "Allow all TCP/3268 to DVSA SCCM"
  type              = "egress"
  from_port         = 3268
  to_port           = 3268
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_sccm_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_sccm_10123" {
  description       = "Allow all TCP/10123 to DVSA SCCM"
  type              = "egress"
  from_port         = 10123
  to_port           = 10123
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_sccm_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_sccm_135" {
  description       = "Allow all TCP/135 to DVSA SCCM"
  type              = "egress"
  from_port         = 135
  to_port           = 135
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_sccm_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_sccm_5986" {
  description       = "Allow all TCP/5986 to DVSA SCCM"
  type              = "egress"
  from_port         = 5986
  to_port           = 5986
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_sccm_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_epo_80" {
  description       = "Allow all TCP/80 to DVSA EPO"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_epo_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_epo_443" {
  description       = "Allow all TCP/443 to DVSA EPO"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_epo_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_epo_8081-8082" {
  description       = "Allow all TCP/8081-8082 to DVSA EPO"
  type              = "egress"
  from_port         = 8081
  to_port           = 8082
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_epo_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_epo_8443-8444" {
  description       = "Allow all TCP/8443-8444 to DVSA EPO"
  type              = "egress"
  from_port         = 8443
  to_port           = 8444
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_epo_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_epo_1433-1434" {
  description       = "Allow all TCP/1433-1434 to DVSA EPO"
  type              = "egress"
  from_port         = 1433
  to_port           = 1434
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_epo_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_epo_389" {
  description       = "Allow all TCP/389 to DVSA EPO"
  type              = "egress"
  from_port         = 389
  to_port           = 389
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_epo_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_epo_636" {
  description       = "Allow all TCP/636 to DVSA EPO"
  type              = "egress"
  from_port         = 636
  to_port           = 636
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_epo_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_epo_445" {
  description       = "Allow all TCP/445 to DVSA EPO"
  type              = "egress"
  from_port         = 445
  to_port           = 445
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_epo_services}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_dvsa_epo_6514" {
  description       = "Allow all TCP/6514 to DVSA EPO"
  type              = "egress"
  from_port         = 6514
  to_port           = 6514
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_epo_services}",
  ]
}

resource "aws_security_group_rule" "dvsa_mgmt_ingress_tars_messaging_all_ports" {
  description       = "Allow all TCP/IP from DVSA mgmt"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_mgmt_inbound}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_IRDT_printers" {
  description       = "Allow all TCP/IP to DVSA IRDT Printers"
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_irdt_printers}",
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_DVSA_printers" {
  description       = "Allow all TCP/IP to DVSA Printers"
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  security_group_id = "${aws_security_group.tars-messaging-ad.id}"

  cidr_blocks = [
    "${var.dvsa_printers}",
  ]
}
