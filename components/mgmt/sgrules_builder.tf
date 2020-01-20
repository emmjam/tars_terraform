resource "aws_security_group_rule" "jenkins_elb_ingress_builder_http" {
  description       = "Allow TCP/80 from jenkins builder"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.jenkins.elb_sg_id
  source_security_group_id = module.builder.security_group_id
}

resource "aws_security_group_rule" "jenkins_elb_ingress_builder_jenkinsnode_49187" {
  description       = "Allow TCP/49187 from jenkins builder"
  type              = "ingress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  security_group_id = module.jenkins.elb_sg_id
  source_security_group_id = module.builder.security_group_id
}

# builder-jenkins_elb
resource "aws_security_group_rule" "builder_egress_jenkins_elb_http" {
  description              = "Allow TCP/80 to Jenkins ELB"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.builder.security_group_id
  source_security_group_id = module.jenkins.elb_sg_id
}

resource "aws_security_group_rule" "builder_egress_jenkins_elb_49187" {
  description              = "Allow TCP/49187 to Jenkins ELB"
  type                     = "egress"
  from_port                = 49187
  to_port                  = 49187
  protocol                 = "tcp"
  security_group_id        = module.builder.security_group_id
  source_security_group_id = module.jenkins.elb_sg_id
}

# builder-gitlab
resource "aws_security_group_rule" "builder_egress_gitlab_ssh" {
  description              = "Allow TCP/22 to GitLab"
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.builder.security_group_id
  source_security_group_id = module.gitlab.elb_private_sg_id
}

# builder-internet
resource "aws_security_group_rule" "builder_egress_internet_https" {
  description       = "Allow TCP/443 to Internet"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = module.builder.security_group_id

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "builder_egress_internet_http" {
  description       = "Allow TCP/80 to Internet"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.builder.security_group_id

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

resource "aws_security_group_rule" "builder_egress_internet_ssh" {
  description       = "Allow TCP/22 to Internet"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.builder.security_group_id

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

#builder-builder -> required to allow SSH comms w/ Packer builder instance inside builder sg
resource "aws_security_group_rule" "builder_egress_self_ssh" {
  description       = "Allow TCP/22 to JenkinsNode"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.builder.security_group_id
  self              = "true"
}

resource "aws_security_group_rule" "builder_ingress_self_ssh" {
  description       = "Allow TCP/22 from JenkinsNode"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.builder.security_group_id
  self              = "true"
}

