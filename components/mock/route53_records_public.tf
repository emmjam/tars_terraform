# Create the R53 record for the public ALB
resource "aws_route53_record" "tars-mock-public" {
  name = format("%s-%s-%s", "mock", var.environment, "public")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars-alb-mock-public.dns_name
    zone_id                = aws_alb.tars-alb-mock-public.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "tars-mock-public-epdq" {
  name = format("%s-%s-%s", "mock-epdq", var.environment, "public")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars-alb-mock-public.dns_name
    zone_id                = aws_alb.tars-alb-mock-public.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "tars-mock-public-gov_gateway" {
  name = format("%s-%s-%s", "mock-gov-gateway", var.environment, "public")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars-alb-mock-public.dns_name
    zone_id                = aws_alb.tars-alb-mock-public.zone_id
    evaluate_target_health = true
  }
}
