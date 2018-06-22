# Create the R53 record for the public ALB
resource "aws_route53_record" "cpc-public" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "public"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.cpc-front.dns_name}"
    zone_id                = "${aws_alb.cpc-front.zone_id}"
    evaluate_target_health = true
  }
}
