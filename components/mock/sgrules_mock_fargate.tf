resource "aws_security_group_rule" "tars_alb_private_ingress_mock_epdq" {
  description              = "Allow TCP/443 to tars mock"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock.id
  security_group_id        = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_db_mock2_egress_port_1521" {
  description              = "Allow TCP/1521 from Mock"
  type                     = "egress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
  security_group_id        = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_db_mock2_ingress_port_1521" {
  description              = "Allow TCP/1521 from Mock"
  type                     = "ingress"
  from_port                = 1521
  to_port                  = 1521
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-db-sg-id
  source_security_group_id = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_backend_egress_tars_alb_mock2_port_8080" {
  description              = "Allow TCP/8080 to TARS mock ALB"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-sg-id
  source_security_group_id = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_backend_ingress_tars_alb_mock2_port_8080" {
  description              = "Allow TCP/8080 to TARS mock ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-sg-id
  security_group_id        = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_alb_public_ingress_mock_epdq" {
  description              = "Allow TCP/443 to tars mock"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.tars-alb-mock-public.id
  security_group_id        = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_back_egress_mock_epdq" {
  description              = "Allow TCP/443 to tars mock"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
  security_group_id        = module.mock_fargate.sg_mock
}

resource "aws_security_group_rule" "tars_back_alb_ingress_mock_epdq" {
  description              = "Allow TCP/443 to tars mock"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = data.terraform_remote_state.tars-core.outputs.tars-core-backend-alb-sg-id
  source_security_group_id = module.mock_fargate.sg_mock
}

