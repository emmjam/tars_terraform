# TARS Core frontend rules
resource "aws_security_group_rule" "tars_core_frontend_ingress_public_alb_port_8443" {
  description              = "Allow TCP/8443 from frontend public ALB"
  type                     = "ingress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = module.tars_front.security_group_id
  source_security_group_id = aws_security_group.tars-dvsa-public.id
}

resource "aws_security_group_rule" "tars_core_frontend_ingress_private_alb_port_7443" {
  description              = "Allow TCP/7443 from frontend public ALB"
  type                     = "ingress"
  from_port                = 7443
  to_port                  = 7443
  protocol                 = "tcp"
  security_group_id        = module.tars_front.security_group_id
  source_security_group_id = aws_security_group.tars-alb-private.id
}

resource "aws_security_group_rule" "tars_core_frontend_ingress_private_alb_port_8443" {
  description              = "Allow TCP/8443 from frontend private ALB"
  type                     = "ingress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = module.tars_front.security_group_id
  source_security_group_id = aws_security_group.tars-alb-private.id
}

resource "aws_security_group_rule" "tars_core_frontend_ingress_internal_alb_port_7443" {
  description              = "Allow TCP/7443 from frontend irdt ALB"
  type                     = "ingress"
  from_port                = 7443
  to_port                  = 7443
  protocol                 = "tcp"
  security_group_id        = module.tars_front.security_group_id
  source_security_group_id = aws_security_group.tars-alb-internal.id
}

resource "aws_security_group_rule" "tars_core_frontend_ingress_internal_alb_port_8443" {
  description              = "Allow TCP/8443 from frontend irdt ALB"
  type                     = "ingress"
  from_port                = 8443
  to_port                  = 8443
  protocol                 = "tcp"
  security_group_id        = module.tars_front.security_group_id
  source_security_group_id = aws_security_group.tars-alb-internal.id
}

resource "aws_security_group_rule" "tars_core_frontend_egress_tars_core_backend_port_8080" {
  description              = "Allow TCP/8080 to backend private ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.tars_front.security_group_id
  source_security_group_id = aws_security_group.tars-alb-backend.id
}

resource "aws_security_group_rule" "tars_core_frontend_egress_oracle_db" {
  description              = "Allow TCP/1521 to the Oracle DB"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = module.tars_front.security_group_id
  source_security_group_id = aws_security_group.tars-core-db.id
}

resource "aws_security_group_rule" "tars_core_frontend_ingress_bastion" {
  description              = "Allow TCP/22 from bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.tars_front.security_group_id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
}

# TODO: peacheym: This is too wide. This only needs to be tcp/443
resource "aws_security_group_rule" "tars_core_frontend_egress_kms_endpoint" {
  description              = "Allow use of KMS endpoint"
  type                     = "egress"
  from_port                = -1
  to_port                  = -1
  protocol                 = "-1"
  security_group_id        = module.tars_front.security_group_id
  source_security_group_id = data.terraform_remote_state.base.outputs.kms_sg_id
}

