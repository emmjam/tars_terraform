resource "aws_route53_zone" "public_domain" {
  count   = var.aws_account_alias == "tarsnonprod" ? 1 : 0
  name          = local.new_vpc_domain_name
  comment       = "The environemnt level Public Hosted Zone used for ACM"
  force_destroy = "false"
}

