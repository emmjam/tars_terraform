resource "aws_security_group_rule" "tars_alb_private_ingress_mock_epdq" {
  description              = "Fargate mock ingress TCP/8080 from mock ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock.id
  security_group_id        = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_db_mock2_egress_port_1521" {
  description              = "Fargate mock egress TCP/1521 to tars db"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
  security_group_id        = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_db_mock2_ingress_port_1521" {
  description              = "TARS DB ingress TCP/1521 from Fargate mock"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
  source_security_group_id = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_backend_egress_tars_alb_mock2_port_8080" {
  description              = "TARS Back egress TCP/8080 to Fargate mock"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-sg-id
  source_security_group_id = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_backend_ingress_tars_alb_mock2_port_8080" {
  description              = "Fargate mock ingress TCP/8080 from TARS back"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-sg-id
  security_group_id        = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_alb_public_ingress_mock_epdq" {
  description              = "Fargate Mock ingress TCP/8080 from mock ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock-public.id
  security_group_id        = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_back_egress_mock_epdq" {
  description              = "Fargate mock egress TCP/8080 to TARS backend ALBs"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
  security_group_id        = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_back_alb_ingress_mock_epdq" {
  description              = "TARS Backend ALBs ingress TCP/8080 from Fargate mock"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
  source_security_group_id = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "mock_gov_gateway_ingress_mock_alb" {
  description              = "Fargate mock ingress TCP/9090 from Mock ALB"
  type                     = "ingress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock.id
  security_group_id        = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "mock_alb_egress_mock_gov_gateway" {
  description              = "Mock ALB egress TCP/9090 to gov gateway"
  type                     = "egress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  source_security_group_id = module.mock_fargate.sg_mock
  security_group_id        = aws_security_group.tars-alb-mock.id
}

resource "aws_security_group_rule" "mock_public_alb_egress_mock_fargate" {
  description              = "Mock public ALB egress TCP/9090 to mock fargate"
  type                     = "egress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  source_security_group_id = module.mock_fargate.sg_mock
  security_group_id        = aws_security_group.tars-alb-mock-public.id
}

resource "aws_security_group_rule" "mock_fargate_ingress_mock_public_alb" {
  description              = "Fargate Mock ingress TCP/9090 from mock public ALB"
  type                     = "ingress"
  from_port                = 9090
  to_port                  = 9090
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock-public.id
  security_group_id        = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "cpc_egress_mock_alb" {
  description              = "CPC egress TCP/9090 to gov gateway"
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock.id
  security_group_id        = data.terraform_remote_state.cpc.outputs.cpc-back-sg-id
}

resource "aws_security_group_rule" "mock_alb_ingress_cpc" {
  description              = "Mock ALB egress TCP/9090 from CPC"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.cpc.outputs.cpc-back-sg-id
  security_group_id        = aws_security_group.tars-alb-mock.id
}

resource "aws_security_group_rule" "obs_egress_mock_alb" {
  description              = "OBS egress TCP/9090 to gov gateway"
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock.id
  security_group_id        = data.terraform_remote_state.apps.outputs.obs-sg-id
}

resource "aws_security_group_rule" "mock_alb_ingress_obs" {
  description              = "Mock ALB ingress TCP/9090 from OBS"
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.apps.outputs.obs-sg-id
  security_group_id        = aws_security_group.tars-alb-mock.id
}

