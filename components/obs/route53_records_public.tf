# Create the R53 record for the public Apache ALB
resource "aws_route53_record" "obs-front" {
  name = "${format(
    "%s-%s-%s",
    var.component,
    var.environment,
    "public"
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "A"

  alias {
    name                   = "${data.terraform_remote_state.tars-core.tars-apache-dns-name}"
    zone_id                = "${data.terraform_remote_state.tars-core.tars-apache-dns-zone-id}"
    evaluate_target_health = true
  }
}
