resource "aws_route53_record" "fyndi" {
  name = "${format(
    "%s-%s",
    "fyndi",
    var.component
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "CNAME"
  ttl     = "5"
  records = ["${var.fyndi_incapsula}"]
}
