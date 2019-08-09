resource "aws_security_group_rule" "alb_private_egress_sonarqube_9000" {
  description              = "Allow TCP/9000 to sonarqube"
  type                     = "egress"
  from_port                = 9000
  to_port                  = 9000
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.alb_private.id}"
  source_security_group_id = "${module.sonarqube.sq_security_group_id}"
}

resource "aws_security_group_rule" "alb_private_ingress_packer" {
  description              = "Allow TCP/80 from packer instance"
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.alb_private.id}"
  source_security_group_id = "${data.terraform_remote_state.ctrl.jenkinsctrl_sg_id}"
}

resource "aws_security_group_rule" "alb_private_egress_nexus_8081" {
  description              = "Allow TCP/8081 to Nexus"
  type                     = "egress"
  from_port                = 8081
  to_port                  = 8081
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.alb_private.id}"
  source_security_group_id = "${module.microservice_nexus.security_group_id}"
}
