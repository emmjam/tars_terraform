resource "aws_route53_record" "sonarqube_private" {
  name    = "sonarqube"
  zone_id = "${aws_route53_zone.mgmt.id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.private.dns_name}"
    zone_id                = "${aws_alb.private.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "ldap_private" {
  name    = "ldap"
  zone_id = "${aws_route53_zone.mgmt.id}"
  type    = "A"

  alias {
    name                   = "${aws_elb.ldap.dns_name}"
    zone_id                = "${aws_elb.ldap.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "nexus_private" {
  name    = "nexus"
  zone_id = "${aws_route53_zone.mgmt.id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.private.dns_name}"
    zone_id                = "${aws_alb.private.zone_id}"
    evaluate_target_health = true
  }
}
