# Create the R53 record for the public ALB
resource "aws_route53_record" "tars-core-public" {
  name = format("%s-%s-%s", var.project, var.environment, "public")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars-dvsa-public.dns_name
    zone_id                = aws_alb.tars-dvsa-public.zone_id
    evaluate_target_health = true
  }
}


resource "aws_route53_record" "tars-dvsa-private" {
  name    = format("%s-%s-%s", var.project, var.environment, "public")
  zone_id = data.terraform_remote_state.ctrl.outputs.private_r53_zone[0]
  type    = "A"

  alias {
    name                   = aws_alb.tars-dvsa-public.dns_name
    zone_id                = aws_alb.tars-dvsa-public.zone_id
    evaluate_target_health = true
  }
}


resource "aws_route53_record" "tars-core-private" {
  name = format("%s-%s-%s", var.project, var.environment, "private")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars-private-facing.dns_name
    zone_id                = aws_alb.tars-private-facing.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "tars_public" {
  name = format("%s-%s-%s", "routing", var.environment, "public")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars_alb_public.dns_name
    zone_id                = aws_alb.tars_alb_public.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "tars_private" {
  name = format("%s-%s-%s", "routing", var.environment, "public")

  zone_id = data.terraform_remote_state.ctrl.outputs.private_r53_zone[0]
  type    = "A"

  alias {
    name                   = aws_alb.tars_alb_public.dns_name
    zone_id                = aws_alb.tars_alb_public.zone_id
    evaluate_target_health = true
  }
}

# Create the R53 record for the IRDT ALB
resource "aws_route53_record" "irdt-public" {
  name = format("%s-%s-%s", "irdt", var.environment, "public")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars_alb_public.dns_name
    zone_id                = aws_alb.tars_alb_public.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "irdt-private" {
  name    = format("%s-%s-%s", "irdt", var.environment, "public")
  zone_id = data.terraform_remote_state.ctrl.outputs.private_r53_zone[0]
  type    = "A"

  alias {
    name                   = aws_alb.tars_alb_public.dns_name
    zone_id                = aws_alb.tars_alb_public.zone_id
    evaluate_target_health = true
  }
}

#Create R53 record for payments ALB

resource "aws_route53_record" "payments-public" {
  name = format("%s-%s-%s", "payments", var.environment, "public")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars-alb-backend-payments.dns_name
    zone_id                = aws_alb.tars-alb-backend-payments.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "payments-private" {
  name    = format("%s-%s-%s", "payments", var.environment, "public")
  zone_id = data.terraform_remote_state.ctrl.outputs.private_r53_zone[0]
  type    = "A"

  alias {
    name                   = aws_alb.tars-alb-backend-payments.dns_name
    zone_id                = aws_alb.tars-alb-backend-payments.zone_id
    evaluate_target_health = true
  }
}

#UAT02
resource "aws_route53_record" "incapsula-frontend" {
  count = var.environment == "uat02" ? 1 : 0
  name  = format("%s-%s-%s", "incapsula", var.environment, "public")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "CNAME"

  ttl = 300

  records = ["wahy2a6.x.incapdns.net"]

}

resource "aws_route53_record" "incapsula-frontend-private" {
  count = var.environment == "uat02" ? 1 : 0
  name  = format("%s-%s-%s", "incapsula", var.environment, "public")

  zone_id = data.terraform_remote_state.ctrl.outputs.private_r53_zone[0]
  type    = "CNAME"

  ttl = 300

  records = ["wahy2a6.x.incapdns.net"]

}

resource "aws_route53_record" "driver-services" {
  # tars-opsdev-driver-services.dvsa.tars.dev-dvsacloud.uk
  count = var.drv_svc_enabled ? 1 : 0

  name = format("%s-%s-%s", var.project, var.environment, "driver-services")

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.tars_alb_drv_svc[0].dns_name
    zone_id                = aws_alb.tars_alb_drv_svc[0].zone_id
    evaluate_target_health = true
  }
}