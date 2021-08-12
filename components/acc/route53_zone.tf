resource "aws_route53_zone" "public_domain" {
  count         = var.public_domain_name == "" ? "0" : "1"
  name          = var.public_domain_name
  comment       = "The account level Public Hosted Zone"
  force_destroy = "false"
}

resource "aws_route53_zone" "public_domain" {
  count         = var.public_domain_name == "" ? "0" : "1"
  name          = var.public_domain_name
  comment = "Private ${var.component} ${var.environment} ${var.private_domain_name} hosted zone"
  vpc {
    vpc_region = var.aws_region
    vpc_id     = aws_vpc.vpc.id
  }

  # See https://github.com/terraform-providers/terraform-provider-aws/issues/7805
  lifecycle {
    ignore_changes = [vpc]
  }
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
