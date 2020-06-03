# nonprod-private-alb-ingress
for_each = var.subnet_numbers
resource "aws_security_group_rule" "alb_ingress_nonprodl_jenkinsnode" {
  description       = "Allow TCP/80 from NonProd JenkinsNodes"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = 

  cidr_blocks =  var.non_prod_jenkins_cidrs
}




