# R53 record for the tars messaging ALB
resource "aws_route53_record" "tars-messaging" {
  name = "${format(
    "%s-%s-%s-%s",
    var.project,
    var.environment,
    var.component,
    "messaging"
  )}"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-alb-messaging-private.dns_name}"
    zone_id                = "${aws_alb.tars-alb-messaging-private.zone_id}"
    evaluate_target_health = true
  }
}


resource "aws_route53_record" "tars-messaging-private" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    var.environment,
    "pdf"
  )}"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.tars-alb-messaging-private.dns_name}"
    zone_id                = "${aws_alb.tars-alb-messaging-private.zone_id}"
    evaluate_target_health = true
  }
}

# Create the R53 record for the private Messaging ELB for RDP
resource "aws_route53_record" "tars-messaging-rdp-private" {
  name = "${format(
    "%s-%s-%s",
    var.project,
    var.environment,
    "rdp"
  )}"

  zone_id = "${data.terraform_remote_state.base.private_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_elb.messaging_private.dns_name}"
    zone_id                = "${aws_elb.messaging_private.zone_id}"
    evaluate_target_health = true
  }
}