resource "aws_route53_record" "tarsdb" {
  name = "tars-core-db"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_db_instance.tarsdb.address}"
    zone_id                = "${aws_db_instance.tarsdb.hosted_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "tars-backend" {
  name = "tars-backend"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-alb-backend-private.dns_name}"
    zone_id                = "${aws_alb.tars-alb-backend-private.zone_id}"
    evaluate_target_health = true
  }
}