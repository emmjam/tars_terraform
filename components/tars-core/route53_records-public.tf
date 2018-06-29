# Create the R53 record for the public ALB
resource "aws_route53_record" "tars-core-public" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    var.environment,
    "public"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-public-facing.dns_name}"
    zone_id                = "${aws_alb.tars-public-facing.zone_id}"
    evaluate_target_health = true
  }
}

# Create the R53 record for the public ALB
resource "aws_route53_record" "irdt-public" {
  name = "${format(
    "%s-%s-%s",
    "irdt",
    var.environment,
    "public"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.irdt-public-facing.dns_name}"
    zone_id                = "${aws_alb.irdt-public-facing.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "tars-core-private" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    var.environment,
    "private"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-private-facing.dns_name}"
    zone_id                = "${aws_alb.tars-private-facing.zone_id}"
    evaluate_target_health = true
  }
}

