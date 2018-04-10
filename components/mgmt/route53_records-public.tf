resource "aws_route53_record" "gitlab" {
  name    = "gitlab"
  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${module.gitlab.public_elb_dns_name}"
    zone_id                = "${module.gitlab.public_elb_zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins"
  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.public.dns_name}"
    zone_id                = "${aws_alb.public.zone_id}"
    evaluate_target_health = true
  }
}
