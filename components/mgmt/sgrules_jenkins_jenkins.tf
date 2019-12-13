# jenkins-gitlab
resource "aws_security_group_rule" "jenkins_egress_gitlab_elb_private_ssh" {
  description              = "Allow TCP/22 to GitLab Private ELB"
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.jenkins.jenkins_sg_id
  source_security_group_id = module.gitlab.elb_private_sg_id
}

# alb-jenkins
resource "aws_security_group_rule" "jenkins_ingress_alb_public_8080" {
  description              = "Allow TCP/8080 from ALB"
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.jenkins.jenkins_sg_id
  source_security_group_id = aws_security_group.alb_public.id
}

