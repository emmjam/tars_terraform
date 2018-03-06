# common
resource "aws_security_group_rule" "common_ingress_bastion_ssh" {
  description              = "Allow TCP/22 from Bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.common.id}"
  source_security_group_id = "${module.bastion.security_group_id}"
}

# mgmt

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
  cidr_blocks       = ["${var.bastion_whitelist}"]
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

# jenkins-gitlab
resource "aws_security_group_rule" "jenkins_egress_gitlab_elb_private_ssh" {
  description              = "Allow TCP/22 to GitLab Private ELB"
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${module.jenkins.jenkins_sg_id}"
  source_security_group_id = "${module.gitlab.elb_private_sg_id}"
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_jenkins_ssh" {
  description              = "Allow TCP/22 from Jenkins"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${module.gitlab.elb_private_sg_id}"
  source_security_group_id = "${module.jenkins.jenkins_sg_id}"
}

resource "aws_security_group_rule" "gitlab_egress_jenkins_elb_80" {
  description              = "Allow TCP/80 to Jenkins"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = "${module.gitlab.gitlab_sg_id}"
  source_security_group_id = "${module.jenkins.elb_sg_id}"
}

resource "aws_security_group_rule" "jenkins_elb_ingress_gitlab_80" {
  description              = "Allow TCP/80 from GitLab"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = "${module.jenkins.elb_sg_id}"
  source_security_group_id = "${module.gitlab.gitlab_sg_id}"
}

# jenkins-jenkinsnode
resource "aws_security_group_rule" "jenkins_elb_ingress_jenkinsnode_80" {
  description              = "Allow TCP/80 from JenkinsNode"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = "${module.jenkins.elb_sg_id}"
  source_security_group_id = "${module.jenkinsnode.security_group_id}"
}

resource "aws_security_group_rule" "jenkins_elb_ingress_jenkinsnode_49187" {
  description              = "Allow TCP/49187 from JenkinsNode"
  type                     = "ingress"
  from_port                = 49187
  to_port                  = 49187
  protocol                 = "tcp"
  security_group_id        = "${module.jenkins.elb_sg_id}"
  source_security_group_id = "${module.jenkinsnode.security_group_id}"
}

resource "aws_security_group_rule" "jenkinsnode_egress_jenkins_elb_80" {
  description              = "Allow TCP/80 to Jenkins ELB"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = "${module.jenkinsnode.security_group_id}"
  source_security_group_id = "${module.jenkins.elb_sg_id}"
}

resource "aws_security_group_rule" "jenkinsnode_egress_jenkins_elb_49187" {
  description              = "Allow TCP/49187 to Jenkins ELB"
  type                     = "egress"
  from_port                = 49187
  to_port                  = 49187
  protocol                 = "tcp"
  security_group_id        = "${module.jenkinsnode.security_group_id}"
  source_security_group_id = "${module.jenkins.elb_sg_id}"
}

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

# jenkinsnode-gitlab
resource "aws_security_group_rule" "jenkinsnode_egress_gitlab_elb_private_ssh" {
  description              = "Allow TCP/22 to GitLab Private ELB"
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${module.jenkinsnode.security_group_id}"
  source_security_group_id = "${module.gitlab.elb_private_sg_id}"
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_jenkinsnode_ssh" {
  description              = "Allow TCP/22 from JenkinsNode"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${module.gitlab.elb_private_sg_id}"
  source_security_group_id = "${module.jenkinsnode.security_group_id}"
}

# alb-jenkins
resource "aws_security_group_rule" "jenkins_ingress_alb_public_8080" {
  description              = "Allow TCP/8080 from ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${module.jenkins.jenkins_sg_id}"
  source_security_group_id = "${aws_security_group.alb_public.id}"
}

resource "aws_security_group_rule" "alb_public_egress_jenkins_8080" {
  description              = "Allow TCP/8080 to Jenkins"
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.alb_public.id}"
  source_security_group_id = "${module.jenkins.jenkins_sg_id}"
}

resource "aws_security_group_rule" "alb_public_ingress_whitelist_https" {
  description       = "Allow TCP/443 from whitelisted IP addresses"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.alb_public.id}"
  cidr_blocks       = ["${var.jenkins_whitelist}"]
}

# jenkins-ctrl_jenkinsnodes
resource "aws_security_group_rule" "jenkins_elb_ingress_ctrl_jenkinsnode_http" {
  count             = "${length(var.ctrl_peers)}"
  description       = "Allow TCP/80 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${module.jenkins.elb_sg_id}"
  cidr_blocks       = ["${lookup(var.ctrl_peers[count.index],"jenkinsnode_subnet")}"]
}

resource "aws_security_group_rule" "jenkins_elb_ingress_ctrl_jenkinsnode_49187" {
  count             = "${length(var.ctrl_peers)}"
  description       = "Allow TCP/49187 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  security_group_id = "${module.jenkins.elb_sg_id}"
  cidr_blocks       = ["${lookup(var.ctrl_peers[count.index],"jenkinsnode_subnet")}"]
}

# gitlab-ctrl_jenkinsnodes
resource "aws_security_group_rule" "gitlab_elb_private_ingress_ctrl_jenkinsnode_ssh" {
  count             = "${length(var.ctrl_peers)}"
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.gitlab.elb_private_sg_id}"
  cidr_blocks       = ["${lookup(var.ctrl_peers[count.index],"jenkinsnode_subnet")}"]
}

# gitlab-internet_ntp
resource "aws_security_group_rule" "gitlab_egress_internet_ntp" {
  description       = "Allow UDP/123 to Internet (NTP)"
  type              = "egress"
  from_port         = 123
  to_port           = 123
  protocol          = "udp"
  security_group_id = "${module.gitlab.gitlab_sg_id}"
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
