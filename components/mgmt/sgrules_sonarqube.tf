resource "aws_security_group_rule" "sonarqube_ingress_bastion_ssh" {
  type                     = "ingress"
  from_port                = "22"
  to_port                  = "22"
  protocol                 = "tcp"
  security_group_id        = module.sonarqube.sq_security_group_id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
}

resource "aws_security_group_rule" "sonarqube_egress_internet_https" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = module.sonarqube.sq_security_group_id

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "sonarqube_egress_internet_http" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "80"
  to_port           = "80"
  security_group_id = module.sonarqube.sq_security_group_id

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "sonarqube_ingress_alb_public" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "9000"
  to_port                  = "9000"
  security_group_id        = module.sonarqube.sq_security_group_id
  source_security_group_id = aws_security_group.alb_public.id
}

resource "aws_security_group_rule" "sonarqube_ingress_alb_private" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "9000"
  to_port                  = "9000"
  security_group_id        = module.sonarqube.sq_security_group_id
  source_security_group_id = aws_security_group.alb_private.id
}

