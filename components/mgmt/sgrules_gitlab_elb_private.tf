# gitlab-ctrl_jenkinsnodes
resource "aws_security_group_rule" "gitlab_elb_private_ingress_base_local_jenkinsnode_ssh" {
  count             = length(var.base_peers_local)
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.gitlab.elb_private_sg_id

  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  cidr_blocks = [
    var.base_peers_local[count.index]["cidr_block"],
  ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_base_xacct_jenkinsnode_ssh" {
  count             = length(var.base_peers_xacct)
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.gitlab.elb_private_sg_id

  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  cidr_blocks = [
    var.base_peers_xacct[count.index]["cidr_block"],
  ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_ctrl_local_jenkinsnode_ssh" {
  count             = length(var.ctrl_peers_local)
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.gitlab.elb_private_sg_id

  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  cidr_blocks = [
    var.ctrl_peers_local[count.index]["cidr_block"],
  ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_ctrl_xacct_jenkinsnode_ssh" {
  count             = length(var.ctrl_peers_xacct)
  description       = "Allow TCP/22 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.gitlab.elb_private_sg_id

  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  cidr_blocks = [
    var.ctrl_peers_xacct[count.index]["cidr_block"],
  ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_ctrl_local_jenkinsnode_https" {
  count             = length(var.ctrl_peers_local)
  description       = "Allow TCP/443 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = module.gitlab.elb_private_sg_id

  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  cidr_blocks = [
    var.ctrl_peers_local[count.index]["cidr_block"],
  ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_ctrl_xacct_jenkinsnode_https" {
  count             = length(var.ctrl_peers_xacct)
  description       = "Allow TCP/443 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = module.gitlab.elb_private_sg_id

  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  cidr_blocks = [
    var.ctrl_peers_xacct[count.index]["cidr_block"],
  ]
}

resource "aws_security_group_rule" "gitlab_elb_private_ingress_jenkins_ssh" {
  description              = "Allow TCP/22 from Jenkins"
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.gitlab.elb_private_sg_id
  source_security_group_id = module.jenkins.jenkins_sg_id
}

