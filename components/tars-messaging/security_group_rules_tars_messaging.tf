# TARS Messaging rules
resource "aws_security_group_rule" "tars_messaging_ingress_private_alb_port_8080" {
  description              = "Allow TCP/8080 from messaging private ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-messaging.id}"
  source_security_group_id = "${aws_security_group.tars-alb-messaging.id}"
}

resource "aws_security_group_rule" "tars_messaging_ingress_alb_port_80" {
  description              = "Allow TCP/80 from messaging private ALB"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-messaging.id}"
  source_security_group_id = "${aws_security_group.tars-alb-messaging.id}"
}

resource "aws_security_group_rule" "tars_messaging_egress_oracle_db" {
  description              = "Allow TCP/1521 to the Oracle DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-messaging.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
}

resource "aws_security_group_rule" "tars_messaging_ingress_bastion" {
  description              = "Allow TCP/22 from bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-messaging.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}

resource "aws_security_group_rule" "tars_messaging_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.tars-messaging.id}"
  source_security_group_id = "${data.terraform_remote_state.base.kms_sg_id}"
}

resource "aws_security_group_rule" "oracle_db_ingress_tars_messaging" {
  description              = "Allow TCP/1521 from TARS Messaging"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-db-sg-id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}

resource "aws_security_group_rule" "tars_messaging_egress_active_mq" {
  description              = "Allow TCP/61617 to AWS MQ"
  type                     = "egress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-messaging.id}"
  source_security_group_id = "${data.terraform_remote_state.base.awsmq_sg_id}"
}

# Allow RDP in from Bastion
resource "aws_security_group_rule" "tars_messaging_ingress_bastion_RDP" {
  description              = "Allow TCP/3389 from bastion"
  type                     = "ingress"
  from_port                = 3389
  to_port                  = 3389
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-messaging.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}

resource "aws_security_group_rule" "bastion_egress_tars_messaging_RDP" {
  description              = "Allow TCP/3389 to Windows Messaging"
  type                     = "egress"
  from_port                = 3389
  to_port                  = 3389
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}

resource "aws_security_group_rule" "tars_messaging_egress_tars_core_backend_alb_8080" {
  description              = "Allow TCP/8080 from messaging to tars core backend ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-messaging.id}"
  source_security_group_id = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
}

resource "aws_security_group_rule" "tars_core_backend_alb_ingres_tars_messaging_8080" {
  description              = "Allow TCP/8080 from messaging to tars core backend ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.tars-core.tars-core-backend-alb-sg-id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}

resource "aws_security_group_rule" "active_mq_ingress_tars_messaging" {
  description              = "Allow TCP/61617 from TARS Messaging"
  type                     = "ingress"
  from_port                = 61617
  to_port                  = 61617
  protocol                 = "tcp"
  security_group_id        = "${data.terraform_remote_state.base.awsmq_sg_id}"
  source_security_group_id = "${aws_security_group.tars-messaging.id}"
}

# This allows the DVSA to RDP in
resource "aws_security_group_rule" "wan_ingress_tars_messaging_port_3389" {
  description       = "Allow TCP/3389 from WAN"
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  security_group_id = "${aws_security_group.tars-messaging.id}"
  cidr_blocks       = ["0.0.0.0/0"]
}