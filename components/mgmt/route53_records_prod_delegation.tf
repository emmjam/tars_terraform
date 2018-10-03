resource "aws_route53_record" "prod_delegate_subdomain" {
  count   = "${length(keys(var.prod_subdomains_name_servers))}"
  name    = "${var.prod_public_domain_name}"
  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "NS"
  ttl     = "172800"
  records = "${split(",",lookup(var.prod_subdomains_name_servers,element(keys(var.prod_subdomains_name_servers),count.index)))}"
}
