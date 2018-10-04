resource "aws_route53_zone" "public_domain" {
  count         = "${var.public_domain_name == "" ? "0" : "1" }"
  name          = "${var.public_domain_name}"
  comment       = "The account level Public Hosted Zone"
  force_destroy = "false"
}

# TODO: import MX/TXT records
