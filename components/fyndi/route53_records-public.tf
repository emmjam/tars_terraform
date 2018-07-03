# Create the R53 record for the public ALB
resource "aws_route53_record" "fyndi" {
  name = "${format(
    "%s-%s-%s",
    var.component,
    var.environment,
    "public"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${aws_alb.fyndi-f.dns_name}"
    zone_id                = "${aws_alb.fyndi-f.zone_id}"
    evaluate_target_health = true
  }
}
