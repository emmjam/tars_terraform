# Create the R53 record for the public ALB
resource "aws_route53_record" "obs-front" {
  name = "${format(
    "%s-%s-%s",
    var.component,
    var.environment,
    "public"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.obs.dns_name}"
    zone_id                = "${aws_alb.obs.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "obs_internal" {
  name = "${format(
    "%s-%s-%s",
    var.component,
    var.environment,
    "internal"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.obs_internal.dns_name}"
    zone_id                = "${aws_alb.obs_internal.zone_id}"
    evaluate_target_health = true
  }
}

