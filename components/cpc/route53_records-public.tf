# Create the R53 record for the public ALB
resource "aws_route53_record" "cpc-internet" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "internet"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.cpc-front-internet.dns_name}"
    zone_id                = "${aws_alb.cpc-front-internet.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "cpc-dva" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "dva"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.cpc-front-dva.dns_name}"
    zone_id                = "${aws_alb.cpc-front-dva.zone_id}"
    evaluate_target_health = true
  }
}

