# Create the private R53 zone for the tars apps
# Keep it generic so it's the same across all VPC's/envs
resource "aws_route53_zone" "tars" {
  name    = "${var.environment}.${var.private_domain_name}"
  comment = "Private ${var.component} ${var.environment} ${var.private_domain_name} hosted zone"
  vpc_id  = "${aws_vpc.vpc.id}"
}
