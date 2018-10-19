resource "aws_ses_domain_mail_from" "tars" {
  domain           = "${aws_ses_domain_identity.tars.domain}"
  mail_from_domain = "mail.${aws_ses_domain_identity.tars.domain}"
}
