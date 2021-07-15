resource "aws_route53_record" "ns_subdomain" {
  count   = length(keys(var.subdomains_name_servers))
  name    = element(keys(var.subdomains_name_servers), count.index)
  zone_id = aws_route53_zone.public_domain[0].zone_id
  type    = "NS"
  ttl     = "172800"

  records = split(
    ",",
    var.subdomains_name_servers[element(keys(var.subdomains_name_servers), count.index)],
  )
}

resource "aws_route53_record" "ns_root_domain" {
  count   = length(var.public_domain_name_root) == 0 ? 0 : 1
  name    = aws_route53_zone.public_domain[count.index].name
  zone_id = aws_route53_zone.public_domain_root[count.index].zone_id
  type    = "NS"
  ttl     = "172800"

  records = flatten(aws_route53_zone.public_domain.*.name_servers)
}
