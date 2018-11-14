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
    name                   = "${aws_alb.tars-dvsa-public.dns_name}"
    zone_id                = "${aws_alb.tars-dvsa-public.zone_id}"
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

resource "aws_route53_record" "apache_public" {
  name = "${format(
    "%s-%s-%s",
    "routing",
    var.environment,
    "public"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.apache_public.dns_name}"
    zone_id                = "${aws_alb.apache_public.zone_id}"
    evaluate_target_health = true
  }
}

# Create the R53 record for the IRDT ALB
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
    name                   = "${aws_alb.apache_public.dns_name}"
    zone_id                = "${aws_alb.apache_public.zone_id}"
    evaluate_target_health = true
  }
}
