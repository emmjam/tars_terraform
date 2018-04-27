# jenkinsnode-bastion
resource "aws_security_group_rule" "jenkinsnode_ingress_bastion_ssh" {
  description       = "Allow TCP/22 from Bastion"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  source_security_group_id = "${module.bastion.security_group_id}"
}

# jenkinsnode-jenkins_elb
resource "aws_security_group_rule" "jenkinsnode_egress_jenkins_elb_http" {
  description       = "Allow TCP/80 to Jenkins ELB"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.mgmt.jenkins_elb_sg_id}"
}

resource "aws_security_group_rule" "jenkinsnode_egress_jenkins_elb_49187" {
  description       = "Allow TCP/49187 to Jenkins ELB"
  type              = "egress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.mgmt.jenkins_elb_sg_id}"
}

# jenkinsnode-gitlab
resource "aws_security_group_rule" "jenkinsnode_egress_gitlab_ssh" {
  description       = "Allow TCP/22 to GitLab"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.mgmt.gitlab_elb_sg_id}"
}

# jenkinsnode-internet
resource "aws_security_group_rule" "jenkinsnode_egress_internet_https" {
  description       = "Allow TCP/443 to Internet"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "jenkinsnode_egress_internet_http" {
  description       = "Allow TCP/80 to Internet"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "jenkinsnode_egress_internet_ssh" {
  description       = "Allow TCP/22 to Internet"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

#jenkinsnode-jenkinsnode -> required to allow SSH comms w/ Packer builder instance inside jenkinsnode sg
resource "aws_security_group_rule" "jenkinsnode_egress_self_ssh" {
  description       = "Allow TCP/22 to JenkinsNode"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  self              = "true"
  security_group_id = "${module.jenkinsnode.security_group_id}"
}

resource "aws_security_group_rule" "jenkinsnode_ingress_self_ssh" {
  description       = "Allow TCP/22 from JenkinsNode"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  self              = "true"
  security_group_id = "${module.jenkinsnode.security_group_id}"
}

# bastion
resource "aws_security_group_rule" "bastion_ingress_elb" {
  description              = "Allow TCP/22 from Bastion ELB"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${module.bastion.security_group_id}"
  source_security_group_id = "${aws_security_group.bastion_elb.id}"
}

resource "aws_security_group_rule" "bastion_egress_all_ssh" {
  description       = "Allow TCP/22 to All"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.bastion.security_group_id}"
  cidr_blocks       = ["10.0.0.0/8"]
}

resource "aws_security_group_rule" "bastion_elb_ingress_whitelist_ssh" {
  description       = "Allow TCP/22 from whitelisted IP addresses"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.bastion_elb.id}"
  cidr_blocks       = ["${var.whitelist}"]
}

resource "aws_security_group_rule" "bastion_elb_egress_bastion" {
  description              = "Allow TCP/22 to Bastion"
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.bastion_elb.id}"
  source_security_group_id = "${module.bastion.security_group_id}"
}
