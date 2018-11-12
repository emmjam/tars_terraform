# Create the R53 record for the public ALB
resource "aws_route53_record" "cpc-dva" {
  name    = "${local.dva_dns_short_name}"
  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.cpc-front-dva.dns_name}"
    zone_id                = "${aws_alb.cpc-front-dva.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "cpc-dvsa-internet" {
  name    = "${local.csi}-dvsa-internet"
  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.cpc-front-dvsa-internet.dns_name}"
    zone_id                = "${aws_alb.cpc-front-dvsa-internet.zone_id}"
    evaluate_target_health = true
  }
}
