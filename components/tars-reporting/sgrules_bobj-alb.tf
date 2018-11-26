resource "aws_security_group_rule" "bobj-alb_ingress_https" {
  description              = ""
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.bobj-alb.id}"
  cidr_blocks = [
    "${var.whitelist}",
  ]

}

resource "aws_security_group_rule" "bobj-alb_egress_http" {
  description              = ""
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.bobj-alb.id}"
  source_security_group_id = "${aws_security_group.bobj.id}"
}

resource "aws_security_group_rule" "bobj_ingress_http" {
  description              = ""
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.bobj-alb.id}"
  security_group_id        = "${aws_security_group.bobj.id}"
}

