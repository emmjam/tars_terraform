resource "aws_route53_zone" "tars" {
  # name    = "${var.component}.${var.environment}.${var.private_domain_name}"
  name    = "${var.private_domain_name}"
  comment = "Private ${var.private_domain_name} hosted zone"
  vpc_id  = "${aws_vpc.vpc.id}"
}
