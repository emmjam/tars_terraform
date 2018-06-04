# R53 record for the tars messaging ALB
resource "aws_route53_record" "tars-messaging" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "messaging"
  )}"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-alb-messaging-private.dns_name}"
    zone_id                = "${aws_alb.tars-alb-messaging-private.zone_id}"
    evaluate_target_health = true
  }
}


resource "aws_route53_record" "tars-messaging-private" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    var.environment,
    "pdf"
  )}"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-alb-messaging-private.dns_name}"
    zone_id                = "${aws_alb.tars-alb-messaging-private.zone_id}"
    evaluate_target_health = true
  }
}
