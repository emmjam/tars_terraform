resource "aws_route53_zone" "mgmt" {
  name    = "${var.component}.${var.environment}.${var.private_domain_name}"
  comment = "Private ${var.environment}.${var.private_domain_name} hosted zone"
  vpc_id  = "${aws_vpc.mgmt.id}"
}
