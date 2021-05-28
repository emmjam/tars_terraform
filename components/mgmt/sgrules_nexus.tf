resource "aws_security_group_rule" "nexus_ingress_bastion_ssh" {
  type                     = "ingress"
  from_port                = "22"
  to_port                  = "22"
  protocol                 = "tcp"
  security_group_id        = module.microservice_nexus.security_group_id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.bastion_sg_id
}

resource "aws_security_group_rule" "nexus_egress_internet_https" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = module.microservice_nexus.security_group_id

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "nexus_egress_internet_http" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "80"
  to_port           = "80"
  security_group_id = module.microservice_nexus.security_group_id

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "nexus_ingress_alb_public" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = var.nexus_config["listen_port"]
  to_port                  = var.nexus_config["listen_port"]
  security_group_id        = module.microservice_nexus.security_group_id
  source_security_group_id = aws_security_group.alb_public.id
}

resource "aws_security_group_rule" "nexus_ingress_alb_private" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = var.nexus_config["listen_port"]
  to_port                  = var.nexus_config["listen_port"]
  security_group_id        = module.microservice_nexus.security_group_id
  source_security_group_id = aws_security_group.alb_private.id
}

# Rule to permit access from nexus to EFS Mount Targets.
resource "aws_security_group_rule" "nexus_egress_nexus_efs_nfs" {
  type                     = "egress"
  from_port                = "2049"
  to_port                  = "2049"
  protocol                 = "tcp"
  security_group_id        = module.microservice_nexus.security_group_id
  source_security_group_id = aws_security_group.nexus_efs.id
}

resource "aws_security_group_rule" "nexus_ingress_jenkinsctrl_https" {
  description       = "Allow TCP/443 from nonprod jenkinsctrl"
  type              = "ingress"
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  security_group_id = module.microservice_nexus.security_group_id

  cidr_blocks = var.non_prod_jenkins_cidrs

}

resource "aws_security_group_rule" "nexus_ingress_jenkinsctrl_http" {
  description       = "Allow TCP/80 from nonprod jenkinsctrl"
  type              = "ingress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  security_group_id = module.microservice_nexus.security_group_id

  cidr_blocks = var.non_prod_jenkins_cidrs

}

