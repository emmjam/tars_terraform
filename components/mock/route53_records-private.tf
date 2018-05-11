# R53 record for the TARS mock ALB
resource "aws_route53_record" "tars-mock" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "mock"
  )}"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-alb-mock-private.dns_name}"
    zone_id                = "${aws_alb.tars-alb-mock-private.zone_id}"
    evaluate_target_health = true
  }
}