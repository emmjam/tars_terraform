# TARS Core mock rules
resource "aws_security_group_rule" "tars_mock_ingress_private_alb_port_8080" {
  description              = "Allow TCP/8080 from mock private ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-mock.id}"
  source_security_group_id = "${aws_security_group.tars-alb-mock.id}"
}

# TARS Core mock rules
resource "aws_security_group_rule" "tars_mock_ingress_public_alb_port_8443" {
  description              = "Allow TCP/8443 from mock public ALB"
  type                     = "ingress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-mock.id}"
  source_security_group_id = "${aws_security_group.tars-alb-mock-public.id}"
}

resource "aws_security_group_rule" "tars_mock_ingress_bastion" {
  description              = "Allow TCP/22 from bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.tars-mock.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}

resource "aws_security_group_rule" "tars_mock_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.tars-mock.id}"
  source_security_group_id = "${data.terraform_remote_state.base.kms_sg_id}"
}

