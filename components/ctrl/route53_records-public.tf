resource "aws_route53_record" "bastion" {
  name    = "bastion"
  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_elb.bastion.dns_name}"
    zone_id                = "${aws_elb.bastion.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "grafana" {
  name    = "grafana"
  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.grafana.dns_name}"
    zone_id                = "${aws_alb.grafana.zone_id}"
    evaluate_target_health = true
  }
}
