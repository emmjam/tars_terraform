# Example SES Domain Identity
resource "aws_ses_domain_identity" "tars" {
  domain = var.public_domain_name
}

resource "aws_ses_domain_identity" "external_mail_domain" {
  count  = var.dvsa_external_mail_domain == "" ? "0" : "1"
  domain = var.dvsa_external_mail_domain
}

