##
# SES
##

resource "aws_route53_record" "amazonses_verification_record" {
  zone_id = data.aws_route53_zone.public.id
  name    = "_amazonses"
  type    = "TXT"
  ttl     = "3600"

  records = [
    aws_ses_domain_identity.tars.verification_token,
  ]
}

resource "aws_route53_record" "ses_domain_mail_from_txt" {
  zone_id = data.aws_route53_zone.public.id
  name    = aws_ses_domain_mail_from.tars.mail_from_domain
  type    = "TXT"
  ttl     = "600"

  records = [
    "v=spf1 include:amazonses.com -all",
  ]
}

resource "aws_route53_record" "ses_domain_mail_from_mx" {
  zone_id = data.aws_route53_zone.public.id
  name    = aws_ses_domain_mail_from.tars.mail_from_domain
  type    = "MX"
  ttl     = "600"

  # TODO: peacheym: Parameterise instead
  # Change to the region in which `aws_ses_domain_identity.example` is created
  records = [
    "10 feedback-smtp.eu-west-1.amazonses.com",
  ]
}

resource "aws_route53_record" "amazonses_dkim_record" {
  count   = "3"
  zone_id = data.aws_route53_zone.public.id

  name = format(
    "%s._domainkey",
    element(aws_ses_domain_dkim.tars.dkim_tokens, count.index),
  )

  type = "CNAME"
  ttl  = "600"

  records = [
    format(
      "%s.dkim.amazonses.com",
      element(aws_ses_domain_dkim.tars.dkim_tokens, count.index),
    ),
  ]
}

##
# Microservices
##

resource "aws_route53_record" "bastion" {
  name    = "bastion"
  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_elb.bastion.dns_name
    zone_id                = aws_elb.bastion.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "grafana" {
  name    = "grafana"
  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_alb.grafana.dns_name
    zone_id                = aws_alb.grafana.zone_id
    evaluate_target_health = true
  }
}

# Create the R53 record for the XE box
resource "aws_route53_record" "oraclexe" {
  count = var.account_environment != "mgmt" ? 1 : 0
  name    = "oraclexe"
  type    = "A"
  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  ttl     = "600"

  records = [
    aws_instance.oraclexe[count.index].private_ip,
  ]
}


