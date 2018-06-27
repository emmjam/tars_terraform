# Create the R53 record for the public ALB
resource "aws_route53_record" "ibs-front" {
  name = "${format(
    "%s-%s",
    var.component,
    "front"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.ibs.dns_name}"
    zone_id                = "${aws_alb.ibs.zone_id}"
    evaluate_target_health = true
  }
}


