# R53 record for the TARS batch ALB
resource "aws_route53_record" "tars-batch" {
  name    = "tars-batch"
  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-alb-batch-private.dns_name}"
    zone_id                = "${aws_alb.tars-alb-batch-private.zone_id}"
    evaluate_target_health = true
  }
}
