resource "aws_route53_record" "prometheus-public" {
  name = "${format(
    "%s.%s",
    "prometheus",
    var.environment,
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.prometheus-public.dns_name}"
    zone_id                = "${aws_alb.prometheus-public.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "prometheus-private" {
  name = "${format(
    "%s.%s",
    "prometheus",
    var.environment,
  )}"

  zone_id = "${aws_route53_zone.vpc.zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.prometheus-private.dns_name}"
    zone_id                = "${aws_alb.prometheus-private.zone_id}"
    evaluate_target_health = true
  }
}