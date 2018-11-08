resource "aws_route53_record" "prometheus-private" {
  name = "${format(
    "%s.%s",
    "prometheus",
    var.component,
  )}"

  zone_id = "${aws_route53_zone.vpc.zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.prometheus-private.dns_name}"
    zone_id                = "${aws_alb.prometheus-private.zone_id}"
    evaluate_target_health = true
  }
}