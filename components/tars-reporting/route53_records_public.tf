resource "aws_route53_record" "bobj-public" {
  name = format("%s-%s", "bobj", var.environment)

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = data.terraform_remote_state.cpc.outputs.cpc_dvsa_internet_alb_dns_name
    zone_id                = data.terraform_remote_state.cpc.outputs.cpc_dvsa_internet_alb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "bobj-dvsa-private" {
  name = format("%s-%s", "bobj", var.environment)

  zone_id = data.terraform_remote_state.ctrl.outputs.private_r53_zone[0]
  type    = "A"

  alias {
    name                   = data.terraform_remote_state.cpc.outputs.cpc_dvsa_internet_alb_dns_name
    zone_id                = data.terraform_remote_state.cpc.outputs.cpc_dvsa_internet_alb_zone_id
    evaluate_target_health = true
  }
}

