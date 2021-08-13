resource "aws_route53_zone" "public_domain" {
  name          = local.vpc_domain_name
  comment       = "The environment level Public Hosted Zone used for ACM"
  force_destroy = "false"
}

resource "aws_route53_record" "public_domain" {
  zone_id = element(concat(data.terraform_remote_state.ctrl.outputs.private_r53_zone, [""]), 0)
  name    = local.vpc_domain_name
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.public_domain.name_servers
}
