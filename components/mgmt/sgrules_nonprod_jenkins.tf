# nonprod-private-alb-ingress
resource "aws_security_group_rule" "alb_ingress_nonprod_jenkinsnode" {
  description       = "Allow TCP/80 from NonProd JenkinsNodes"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.alb_private.id

  cidr_blocks = var.non_prod_jenkins_cidrs
}

resource "aws_security_group_rule" "alb_ingress_nonprod_jenkinsnode_443" {
  description       = "Allow TCP/443 from NonProd JenkinsNodes"
  type              = "ingress"
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  security_group_id = aws_security_group.alb_private.id

  cidr_blocks = var.non_prod_jenkins_cidrs

}