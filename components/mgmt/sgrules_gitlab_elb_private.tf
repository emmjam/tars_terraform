# gitlab-ctrl_jenkinsnodes
resource "aws_security_group_rule" "gitlab_elb_private_ingress_base_local_jenkinsnode_ssh" {
  count             = "${length(var.base_peers_local)}"
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.gitlab.elb_private_sg_id}"

  cidr_blocks = [
    "${lookup(
      var.base_peers_local[count.index],
      "cidr_block"
    )}",
  ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_base_xacct_jenkinsnode_ssh" {
  count             = "${length(var.base_peers_xacct)}"
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.gitlab.elb_private_sg_id}"

  cidr_blocks = [
    "${lookup(
      var.base_peers_xacct[count.index],
      "cidr_block"
    )}",
  ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_ctrl_local_jenkinsnode_ssh" {
  count             = "${length(var.ctrl_peers_local)}"
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.gitlab.elb_private_sg_id}"

  cidr_blocks = [
    "${lookup(
      var.ctrl_peers_local[count.index],
      "cidr_block"
    )}",
  ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_ctrl_xacct_jenkinsnode_ssh" {
  count             = "${length(var.ctrl_peers_xacct)}"
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.gitlab.elb_private_sg_id}"

  cidr_blocks = [
    "${lookup(
      var.ctrl_peers_xacct[count.index],
      "cidr_block"
    )}",
  ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_ctrl_local_jenkinsnode_https" {
  count             = "${length(var.ctrl_peers_local)}"
  description       = "Allow TCP/443 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${module.gitlab.elb_private_sg_id}"

  cidr_blocks = [
    "${lookup(
      var.ctrl_peers_local[count.index],
      "cidr_block"
    )}",
  ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_ctrl_xacct_jenkinsnode_https" {
  count             = "${length(var.ctrl_peers_xacct)}"
  description       = "Allow TCP/443 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${module.gitlab.elb_private_sg_id}"

  cidr_blocks = [
    "${lookup(
      var.ctrl_peers_xacct[count.index],
      "cidr_block"
    )}",
  ]
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
