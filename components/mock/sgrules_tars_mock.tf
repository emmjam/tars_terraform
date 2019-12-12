# TARS Core mock rules
resource "aws_security_group_rule" "tars_mock_ingress_private_alb_port_8080" {
  description              = "Allow TCP/8080 from mock private ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mock.id
  source_security_group_id = aws_security_group.tars-alb-mock.id
}

# TARS Core mock rules
resource "aws_security_group_rule" "tars_mock_ingress_public_alb_port_8443" {
  description              = "Allow TCP/8443 from mock public ALB"
  type                     = "ingress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mock.id
  source_security_group_id = aws_security_group.tars-alb-mock-public.id
}

resource "aws_security_group_rule" "tars_mock_ingress_bastion" {
  description              = "Allow TCP/22 from bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mock.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
}

resource "aws_security_group_rule" "tars_mock_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = aws_security_group.tars-mock.id
  source_security_group_id = data.terraform_remote_state.base.outputs.kms_sg_id
}

resource "aws_security_group_rule" "mock_cpc_db_egress_port_1521" {
  description              = "Allow TCP/1521 to CPC DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mock.id
  source_security_group_id = data.terraform_remote_state.cpc.outputs.cpc-db-sg-id
}

# Both TARS Batch and the NLB are in the TARS backend subnet so we require only one ingress rule
# Otherwise we would require ingress rules for the CIDR blocks of both the NLB (for health checks)
# and TARS Batch           
resource "aws_security_group_rule" "mocksftp_ingress_tars_batch" {
  description       = "Allow TCP/22 in from NLB for tars batch"
  type              = "ingress"
  from_port         = "22"
  to_port           = "22"
  protocol          = "tcp"
  security_group_id = aws_security_group.tars-mock.id

  cidr_blocks = data.terraform_remote_state.base.outputs.subnet_cidrs_tars_backend
}

resource "aws_security_group_rule" "mock_tars_db_egress_port_1521" {
  description              = "Allow TCP/1521 to tars DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = aws_security_group.tars-mock.id
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
}

