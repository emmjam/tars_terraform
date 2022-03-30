# Create the R53 record for the Public ALB
resource "aws_route53_record" "obs-front" {
  name    = format("%s-%s-%s", "obs", var.environment, "public")
  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = data.terraform_remote_state.tars-core.outputs.tars-core-dns-name
    zone_id                = data.terraform_remote_state.tars-core.outputs.tars-core-dns-zone-id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "obs-front_private" {
  name    = format("%s-%s-%s", "obs", var.environment, "public")
  zone_id = data.terraform_remote_state.ctrl.outputs.private_r53_zone[0]
  type    = "A"

  alias {
    name                   = data.terraform_remote_state.tars-core.outputs.tars-core-dns-name
    zone_id                = data.terraform_remote_state.tars-core.outputs.tars-core-dns-zone-id
    evaluate_target_health = true
  }
}
