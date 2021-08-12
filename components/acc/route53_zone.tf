resource "aws_route53_zone" "public_domain" {
  count         = var.public_domain_name == "" ? "0" : "1"
  name          = var.public_domain_name
  comment       = "The account level Public Hosted Zone"
  force_destroy = "false"
}

resource "aws_route53_zone" "public_domain" {
  count         = var.public_domain_name == "" ? "0" : "1"
  name          = var.public_domain_name
  comment       = "The account level Public Hosted Zone"
  force_destroy = "false"
}

resource "aws_route53_zone" "public_domain_root" {
  count         = var.public_domain_name_root == "" ? "0" : "1"
  name          = var.public_domain_name_root
  comment       = "The root level Public Hosted Zone"
  force_destroy = "false"
}

resource "aws_route53_zone" "public_domain_acm" {
  count         = var.public_domain_name_acm == "" ? "0" : "1"
  name          = var.public_domain_name_acm
  comment       = "The account level Public Hosted Zone used for ACM"
  force_destroy = "false"
}
