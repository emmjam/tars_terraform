resource "aws_security_group_rule" "jmeter_ingress_jenkinsnode_22" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "22"
  to_port                  = "22"
  security_group_id        = module.microservice_jmeter.security_group_id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
}

resource "aws_security_group_rule" "jmeter_egress_jenkinsctrl_1099_1101" {
  description              = "Allow Jenkinsctrl to Jmeter"
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = "1099"
  to_port                  = "1101"
  security_group_id        = module.microservice_jmeter.security_group_id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
}

resource "aws_security_group_rule" "jmeter_ingress_jenkinsctrl_1099_1101" {
  description              = "Allow Jmeter to JenkinsCtrl"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "1099"
  to_port                  = "1101"
  security_group_id        = module.microservice_jmeter.security_group_id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
}

# jmeter-gitlab
resource "aws_security_group_rule" "jmeter_egress_gitlab_ssh" {
  description       = "Allow TCP/22 to GitLab"
  type              = "egress"
  protocol          = "tcp"
  from_port         = "22"
  to_port           = "22"
  security_group_id = module.microservice_jmeter.security_group_id

  cidr_blocks = [
    var.mgmt_gitlab_subnet,
  ]
}

resource "aws_security_group_rule" "jmeter_ingress_jmeter_1099_1101" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = "1099"
  to_port           = "1101"
  security_group_id = module.microservice_jmeter.security_group_id
  self              = "true"
}

resource "aws_security_group_rule" "jmeter_egress_jmeter_1099_1101" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "1099"
  to_port           = "1101"
  security_group_id = module.microservice_jmeter.security_group_id
  self              = "true"
}

resource "aws_security_group_rule" "jenkinsnode_egress_natgw_https" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "443"
  to_port           = "443"
  security_group_id = module.microservice_jmeter.security_group_id

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "jenkinsnode_egress_natgw_http" {
  type              = "egress"
  protocol          = "tcp"
  from_port         = "80"
  to_port           = "80"
  security_group_id = module.microservice_jmeter.security_group_id

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

# jenkinsctrl-jmeter
resource "aws_security_group_rule" "jenkinsctrl_egress_jmeter_ssh" {
  description              = "Allow TCP/22 to Jmeter"
  type                     = "egress"
  from_port                = "22"
  to_port                  = "22"
  protocol                 = "tcp"
  security_group_id        = module.microservice_jmeter.security_group_id
  source_security_group_id = data.terraform_remote_state.ctrl.outputs.jenkinsctrl_sg_id
}