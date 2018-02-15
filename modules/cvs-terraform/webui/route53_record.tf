resource "aws_route53_record" "main" {
  count   = "${var.public_domain_name != "" ? 1 : 0 }"
  name    = "${var.api_gateway_dns_alias != "" ? var.api_gateway_dns_alias : "${var.component}-${var.environment}"}"
  zone_id = "${data.aws_route53_zone.public.zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_api_gateway_domain_name.atf_account_view.cloudfront_domain_name}"
    zone_id                = "${aws_api_gateway_domain_name.atf_account_view.cloudfront_zone_id }"
    evaluate_target_health = false
  }

  depends_on = ["aws_api_gateway_domain_name.atf_account_view"]
}
