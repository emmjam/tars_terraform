resource "aws_security_group_rule" "build_ingress_ssh" {
  description       = "Allow SSH in from whitelist to build instances"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.build.id

  cidr_blocks = var.whitelist
}

resource "aws_security_group_rule" "build_ingress_jenkinsctrl_ssh" {
  description              = "Allow SSH in from jenkinsctrl to build instances"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.build.id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
}

resource "aws_security_group_rule" "build_ingress_builder_ssh" {
  description              = "Allow SSH in from builder to build instances"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.build.id
  source_security_group_id = module.builder.security_group_id
}

