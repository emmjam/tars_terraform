resource "aws_route53_record" "irdt" {
  name = "${format(
    "%s-%s",
    "irdt",
    var.component
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "CNAME"
  ttl     = "5"
  records = ["${var.irdt_incapsula}"]
}
