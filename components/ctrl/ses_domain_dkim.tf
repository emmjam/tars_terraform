resource "aws_ses_domain_dkim" "tars" {
  domain = "${aws_ses_domain_identity.tars.domain}"
}

resource "aws_ses_domain_dkim" "external_mail_domain_dkim" {
  count  = "${var.dvsa_external_mail_domain == "" ? "0" : "1" }"
  domain = "${aws_ses_domain_identity.external_mail_domain.domain}"
}

