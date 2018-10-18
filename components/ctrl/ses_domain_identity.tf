# Example SES Domain Identity
resource "aws_ses_domain_identity" "tars" {
  domain = "${var.public_domain_name}"
}
