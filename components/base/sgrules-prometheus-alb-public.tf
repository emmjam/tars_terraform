resource "aws_security_group_rule" "prometheus-alb-public" {
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 80
  to_port                  = 80
  security_group_id        = "${aws_security_group.prometheus-alb-public.id}"
  cidr_blocks              = ["${var.whitelist}"]
}
