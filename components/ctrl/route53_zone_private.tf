resource "aws_route53_zone" "ctrl" {
  name    = "${local.vpc_domain_name}"
  comment = "Private ${local.vpc_domain_name} hosted zone"
  vpc_id  = "${aws_vpc.ctrl.id}"
}
