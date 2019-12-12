# mgmt
# jenkins-ctrl_jenkinsnodes
resource "aws_security_group_rule" "jenkins_elb_ingress_ctrl_local_jenkinsnode_http" {
  count             = length(var.ctrl_peers_local)
  description       = "Allow TCP/80 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.jenkins.elb_sg_id

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

resource "aws_security_group_rule" "jenkins_elb_ingress_ctrl_local_jenkinsnode_49187" {
  count             = length(var.ctrl_peers_local)
  description       = "Allow TCP/49187 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  security_group_id = module.jenkins.elb_sg_id

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

resource "aws_security_group_rule" "jenkins_elb_ingress_ctrl_xacct_jenkinsnode_http" {
  count             = length(var.ctrl_peers_xacct)
  description       = "Allow TCP/80 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.jenkins.elb_sg_id

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

resource "aws_security_group_rule" "jenkins_elb_ingress_ctrl_xacct_jenkinsnode_49187" {
  count             = length(var.ctrl_peers_xacct)
  description       = "Allow TCP/49187 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  security_group_id = module.jenkins.elb_sg_id

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

resource "aws_security_group_rule" "jenkins_elb_ingress_base_local_jenkinsnode_http" {
  count             = length(var.base_peers_local)
  description       = "Allow TCP/80 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.jenkins.elb_sg_id

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

resource "aws_security_group_rule" "jenkins_elb_ingress_base_local_jenkinsnode_49187" {
  count             = length(var.base_peers_local)
  description       = "Allow TCP/49187 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  security_group_id = module.jenkins.elb_sg_id

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

resource "aws_security_group_rule" "jenkins_elb_ingress_base_xacct_jenkinsnode_http" {
  count             = length(var.base_peers_xacct)
  description       = "Allow TCP/80 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.jenkins.elb_sg_id

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

resource "aws_security_group_rule" "jenkins_elb_ingress_base_xacct_jenkinsnode_49187" {
  count             = length(var.base_peers_xacct)
  description       = "Allow TCP/49187 from CTRL JenkinsNodes"
  type              = "ingress"
  from_port         = 49187
  to_port           = 49187
  protocol          = "tcp"
  security_group_id = module.jenkins.elb_sg_id

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

resource "aws_security_group_rule" "jenkins_elb_ingress_gitlab_80" {
  description              = "Allow TCP/80 from GitLab"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.jenkins.elb_sg_id
  source_security_group_id = module.gitlab.gitlab_sg_id
}

