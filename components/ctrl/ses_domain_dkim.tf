resource "aws_ses_domain_dkim" "tars" {
  domain = "${aws_ses_domain_identity.tars.domain}"
}
