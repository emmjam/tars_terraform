# common
resource "aws_security_group_rule" "common_ingress_bastion_ssh" {
  description              = "Allow TCP/22 from Bastion"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.common.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}

# mgmt
# jenkins-ctrl_jenkinsnodes
resource "aws_security_group_rule" "jenkins_elb_ingress_ctrl_local_jenkinsnode_http" {
  count             = "${length(var.ctrl_peers_local)}"
  description       = "Allow TCP/80 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${module.jenkins.elb_sg_id}"
  cidr_blocks       = [ "${lookup(var.ctrl_peers_local[count.index], "cidr_block")}" ] 
}

resource "aws_security_group_rule" "jenkins_elb_ingress_ctrl_local_jenkinsnode_49187" {
  count             = "${length(var.ctrl_peers_local)}"
  description       = "Allow TCP/49187 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  security_group_id = "${module.jenkins.elb_sg_id}"
  cidr_blocks       = [ "${lookup(var.ctrl_peers_local[count.index], "cidr_block")}" ]
}

resource "aws_security_group_rule" "jenkins_elb_ingress_ctrl_xacct_jenkinsnode_http" {
  count             = "${length(var.ctrl_peers_xacct)}"
  description       = "Allow TCP/80 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${module.jenkins.elb_sg_id}"
  cidr_blocks       = [ "${lookup(var.ctrl_peers_xacct[count.index], "cidr_block")}" ]
}

resource "aws_security_group_rule" "jenkins_elb_ingress_ctrl_xacct_jenkinsnode_49187" {
  count             = "${length(var.ctrl_peers_xacct)}"
  description       = "Allow TCP/49187 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  security_group_id = "${module.jenkins.elb_sg_id}"
  cidr_blocks       = [ "${lookup(var.ctrl_peers_xacct[count.index], "cidr_block")}" ]
}

resource "aws_security_group_rule" "jenkins_elb_ingress_base_local_jenkinsnode_http" {
  count             = "${length(var.base_peers_local)}"
  description       = "Allow TCP/80 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${module.jenkins.elb_sg_id}"
  cidr_blocks       = [ "${lookup(var.base_peers_local[count.index], "cidr_block")}" ]
}

resource "aws_security_group_rule" "jenkins_elb_ingress_base_local_jenkinsnode_49187" {
  count             = "${length(var.base_peers_local)}"
  description       = "Allow TCP/49187 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  security_group_id = "${module.jenkins.elb_sg_id}"
  cidr_blocks       = [ "${lookup(var.base_peers_local[count.index], "cidr_block")}" ]
}

resource "aws_security_group_rule" "jenkins_elb_ingress_base_xacct_jenkinsnode_http" {
  count             = "${length(var.base_peers_xacct)}"
  description       = "Allow TCP/80 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 80   
  to_port           = 80   
  protocol          = "tcp"
  security_group_id = "${module.jenkins.elb_sg_id}"
  cidr_blocks       = [ "${lookup(var.base_peers_xacct[count.index], "cidr_block")}" ]
} 
  
resource "aws_security_group_rule" "jenkins_elb_ingress_base_xacct_jenkinsnode_49187" {
  count             = "${length(var.base_peers_xacct)}"
  description       = "Allow TCP/49187 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  security_group_id = "${module.jenkins.elb_sg_id}"
  cidr_blocks       = [ "${lookup(var.base_peers_xacct[count.index], "cidr_block")}" ]
}

# gitlab-ctrl_jenkinsnodes
resource "aws_security_group_rule" "gitlab_elb_private_ingress_base_local_jenkinsnode_ssh" {
  count             = "${length(var.base_peers_local)}"
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.gitlab.elb_private_sg_id}"
  cidr_blocks       = [ "${lookup(var.base_peers_local[count.index], "cidr_block")}" ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_base_xacct_jenkinsnode_ssh" {
  count             = "${length(var.base_peers_xacct)}"
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.gitlab.elb_private_sg_id}"
  cidr_blocks       = [ "${lookup(var.base_peers_xacct[count.index], "cidr_block")}" ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_ctrl_local_jenkinsnode_ssh" {
  count             = "${length(var.ctrl_peers_local)}"
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.gitlab.elb_private_sg_id}"
  cidr_blocks       = [ "${lookup(var.ctrl_peers_local[count.index], "cidr_block")}" ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_ctrl_xacct_jenkinsnode_ssh" {
  count             = "${length(var.ctrl_peers_xacct)}"
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.gitlab.elb_private_sg_id}"
  cidr_blocks       = [ "${lookup(var.ctrl_peers_xacct[count.index], "cidr_block")}" ]
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
  cidr_blocks       = ["${var.whitelist}"]
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
