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
