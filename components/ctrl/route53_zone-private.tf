resource "aws_route53_zone" "ctrl" {
  name    = "${var.component}.${var.environment}.${var.private_domain_name}"
  comment = "Private ${var.component}.${var.environment}.${var.private_domain_name} hosted zone"
  vpc_id  = "${aws_vpc.ctrl.id}"
}
