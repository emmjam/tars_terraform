resource "aws_route53_record" "gitlab" {
  name    = "${var.r53_record_name}"
  zone_id = "${var.hosted_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_elb.gitlab_private.dns_name}"
    zone_id                = "${aws_elb.gitlab_private.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "db" {
  name    = "gitlab-db"
  zone_id = "${var.hosted_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_db_instance.gitlab.address}"
    zone_id                = "${aws_db_instance.gitlab.hosted_zone_id}"
    evaluate_target_health = true
  }
}
