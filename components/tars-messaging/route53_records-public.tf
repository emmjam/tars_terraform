# Create the R53 record for the public Messaging ALB
resource "aws_route53_record" "tars-messaging-public" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    var.environment,
    "pdf"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.messaging-public-facing.dns_name}"
    zone_id                = "${aws_alb.messaging-public-facing.zone_id}"
    evaluate_target_health = true
  }
}

# Create the R53 record for the public Messaging ELB for RDP
resource "aws_route53_record" "tars-messaging-rdp-public" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    var.environment,
    "rdp"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_elb.messaging_public.dns_name}"
    zone_id                = "${aws_elb.messaging_public.zone_id}"
    evaluate_target_health = true
  }
}
