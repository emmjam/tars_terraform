# TARS Messaging A/D rules

# The IP range includes the DVSA DNS servers no extra rules required.
resource "aws_security_group_rule" "tars_messaging_egress_dvsa_dc" {
  description       = "Allow all TCP/IP to DVSA DC"
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  security_group_id = aws_security_group.tars-messaging-ad.id

  cidr_blocks = var.dvsa_dc_whitelist
}

resource "aws_security_group_rule" "dvsa_mgmt_ingress_tars_messaging_all_ports" {
  description       = "Allow all TCP/IP from DVSA mgmt"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  security_group_id = aws_security_group.tars-messaging-ad.id

  cidr_blocks = [
    var.dvsa_mgmt_inbound
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_IRDT_printers" {
  description       = "Allow all TCP/IP to DVSA IRDT Printers"
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  security_group_id = aws_security_group.tars-messaging-ad.id

  cidr_blocks = [
    var.dvsa_irdt_printers,
  ]
}

resource "aws_security_group_rule" "tars_messaging_egress_DVSA_printers" {
  count             = length(var.messaging_print) == 0 ? 0 : 1
  description       = "Allow all TCP/IP to DVSA Printers"
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  security_group_id = aws_security_group.tars-messaging-ad.id

  cidr_blocks = var.dvsa_printers
}

resource "aws_security_group_rule" "dvsa_win_monitor_ingress_tars_messaging_ICMP" {
  description       = "Allow all ICMP from DVSA monitoring"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "ICMP"
  security_group_id = aws_security_group.tars-messaging-ad.id

  cidr_blocks = var.dvsa_icmp_monitoring
}

resource "aws_security_group_rule" "dvsa_ingress_tars_messaging_win_rpc_port" {
  description       = "Allow RPC from DVSA monitoring"
  type              = "ingress"
  from_port         = 135
  to_port           = 135
  protocol          = "TCP"
  security_group_id = aws_security_group.tars-messaging-ad.id

  cidr_blocks = var.dvsa_win_monitoring
}

resource "aws_security_group_rule" "dvsa_ingress_tars_messaging_win_smb_port" {
  description       = "Allow SMB from DVSA monitoring"
  type              = "ingress"
  from_port         = 445
  to_port           = 445
  protocol          = "TCP"
  security_group_id = aws_security_group.tars-messaging-ad.id

  cidr_blocks = var.dvsa_win_monitoring
}

resource "aws_security_group_rule" "dvsa_ingress_tars_messaging_win_dynamic_ports" {
  description       = "Allow all Dynamic Ports from DVSA monitoring"
  type              = "ingress"
  from_port         = 49152
  to_port           = 65535
  protocol          = "TCP"
  security_group_id = aws_security_group.tars-messaging-ad.id

  cidr_blocks = var.dvsa_win_monitoring
}

