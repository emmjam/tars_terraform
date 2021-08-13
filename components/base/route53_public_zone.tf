resource "aws_route53_zone" "public_domain" {
  name          = local.new_vpc_domain_name
  comment       = "The environment level Public Hosted Zone used for ACM"
  force_destroy = "false"
}

resource "aws_route53_record" "public_domain_nonprod" {
  count   = var.aws_account_alias == "tarsnonprod" ? 1 : 0
  zone_id = data.terraform_remote_state.acc.outputs.public_domain_root_zone_id
  name    = local.vpc_domain_name
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.public_domain.name_servers
}
