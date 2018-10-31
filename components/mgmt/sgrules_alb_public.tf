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

  cidr_blocks = [
    "${var.whitelist}",
  ]
}
