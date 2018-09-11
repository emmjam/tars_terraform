resource "aws_route53_record" "ibs" {
  name = "${format(
    "%s-%s",
    "ibs",
    var.component
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "CNAME"
  ttl     = "5"
  records = ["${var.ibs_incapsula}"]
}
