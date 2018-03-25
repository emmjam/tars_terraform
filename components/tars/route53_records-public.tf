# Create the R53 record for the public ALB
resource "aws_route53_record" "tars-core-public" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    var.environment,
    "public"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-public-facing.dns_name}"
    zone_id                = "${aws_alb.tars-public-facing.zone_id}"
    evaluate_target_health = true
  }
}
