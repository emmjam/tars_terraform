resource "aws_security_group_rule" "gitlab_egress_jenkins_elb_80" {
  description              = "Allow TCP/80 to Jenkins"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.gitlab.gitlab_sg_id
  source_security_group_id = module.jenkins.elb_sg_id
}

# gitlab-internet_ntp
resource "aws_security_group_rule" "gitlab_egress_internet_ntp" {
  description       = "Allow UDP/123 to Internet (NTP)"
  type              = "egress"
  from_port         = 123
  to_port           = 123
  protocol          = "udp"
  security_group_id = module.gitlab.gitlab_sg_id

  cidr_blocks = [
    "0.0.0.0/0",
  ]
}

