resource "aws_route53_record" "obs" {
  name = "${format(
    "%s-%s",
    "obs",
    var.component
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "CNAME"
  ttl     = "5"
  records = ["${var.obs_incapsula}"]
}
