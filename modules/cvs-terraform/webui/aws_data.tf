data "aws_caller_identity" "current" {}

data "aws_route53_zone" "public" {
  count        = "${var.public_domain_name != "" ? 1 : 0 }"
  name         = "${var.public_domain_name}."
  private_zone = false
}
