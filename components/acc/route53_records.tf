resource "aws_route53_record" "ns_subdomain" {
  count   = "${length(keys(var.subdomains_name_servers))}"
  name    = "${element(keys(var.subdomains_name_servers),count.index)}"
  zone_id = "${aws_route53_zone.public_domain.zone_id}"
  type    = "NS"
  ttl     = "172800"
  records = "${split(",",lookup(var.subdomains_name_servers,element(keys(var.subdomains_name_servers),count.index)))}"
}
