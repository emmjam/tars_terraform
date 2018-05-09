resource "aws_security_group_rule" "obs-ingress-obs-alb-8080" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = "8080"
  to_port                  = "8080"
  security_group_id        = "${aws_security_group.obs.id}"
  source_security_group_id = "${aws_security_group.obs-alb.id}"
}

