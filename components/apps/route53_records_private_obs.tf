# Create the R53 record for the public ALB
resource "aws_route53_record" "obs-internal" {
  name    = "obs-internal"
  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.obs.dns_name}"
    zone_id                = "${aws_alb.obs.zone_id}"
    evaluate_target_health = true
  }
}
