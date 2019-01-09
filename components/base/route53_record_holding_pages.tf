resource "aws_route53_record" "holding_pages" {
  name = "${format(
    "%s-%s",
    "maintenance",
    var.environment,
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.holding_pages.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.holding_pages.hosted_zone_id}"
    evaluate_target_health = true
  }
}