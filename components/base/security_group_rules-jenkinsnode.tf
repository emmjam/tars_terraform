# jenkinsnode-bastion
resource "aws_security_group_rule" "jenkinsnode_ingress_bastion_ssh" {
  description       = "Allow TCP/22 from Bastion"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.bastion_sg_id}"
}

# jenkinsnode-jenkins_elb
resource "aws_security_group_rule" "jenkinsnode_egress_jenkins_elb_http" {
  description       = "Allow TCP/80 to Jenkins ELB"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  cidr_blocks       = ["${var.mgmt_jenkins_elb_subnet}"]
}

# jenkinsnode-swarm
resource "aws_security_group_rule" "jenkinsnode_egress_jenkins_elb_49187" {
  description       = "Allow TCP/49187 to Jenkins ELB"
  type              = "egress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  cidr_blocks       = ["${var.mgmt_jenkins_elb_subnet}"]
}

### jenkins-jenkinsnodes
resource "aws_security_group_rule" "jenkins_elb_ingress_jenkinsnode_http" {
  description       = "Allow TCP/80 from OpsDev JenkinsNodes"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = "${module.jenkinsnode.security_group_id}"
  security_group_id = "${data.terraform_remote_state.mgmt.jenkins_elb_sg_id}"
}

resource "aws_security_group_rule" "jenkins_elb_ingress_jenkinsnode_49187" {
  description       = "Allow TCP/49187 from OpsDev JenkinsNodes"
  type              = "ingress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  source_security_group_id = "${module.jenkinsnode.security_group_id}"
  security_group_id = "${data.terraform_remote_state.mgmt.jenkins_elb_sg_id}"
}

# jenkinsnode-gitlab
resource "aws_security_group_rule" "jenkinsnode_egress_gitlab_ssh" {
  description       = "Allow TCP/22 to GitLab"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  cidr_blocks       = ["${var.mgmt_gitlab_subnet}"]
}


# gitlab-opsdev_jenkinsnodes
resource "aws_security_group_rule" "gitlab_elb_private_ingress_jenkinsnode_ssh" {
  description       = "Allow TCP/22 from OpsDev JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = "${module.jenkinsnode.security_group_id}"
  security_group_id = "${data.terraform_remote_state.mgmt.gitlab_elb_sg_id}"
}

# jenkinsnode-internet-https
resource "aws_security_group_rule" "jenkinsnode_egress_internet_https" {
  description       = "Allow TCP/443 to Internet"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

# jenkinsnode-internet-http
resource "aws_security_group_rule" "jenkinsnode_egress_internet_http" {
  description       = "Allow TCP/80 to Internet"
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

# jenkinsnode-internet-ssh
resource "aws_security_group_rule" "jenkinsnode_egress_internet_ssh" {
  description       = "Allow TCP/22 to Internet"
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.jenkinsnode.security_group_id}"
  cidr_blocks       = ["0.0.0.0/0"]
}
