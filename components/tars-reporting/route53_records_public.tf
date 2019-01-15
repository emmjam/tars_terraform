resource "aws_route53_record" "bobj-public" {
  name = "${format(
    "%s-%s",
    "bobj",
    var.environment,
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-alb-bobj-private.dns_name}"
    zone_id                = "${aws_alb.tars-alb-bobj-private.zone_id}"
    evaluate_target_health = true
  }
}

