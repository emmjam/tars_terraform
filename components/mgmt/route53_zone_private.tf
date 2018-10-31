resource "aws_route53_zone" "mgmt" {
  name    = "${var.component}.${local.vpc_domain_name}"
  comment = "Private ${local.vpc_domain_name} hosted zone"
  vpc_id  = "${aws_vpc.mgmt.id}"
}
