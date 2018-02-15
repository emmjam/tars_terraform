data "aws_acm_certificate" "main" {
  count    = "${var.public_domain_name != "" ? 1 : 0 }"
  provider = "aws.acm-us-east-1"
  domain   = "${var.acm_cert_prefix}.${var.public_domain_name}"
  statuses = ["ISSUED"]
}
