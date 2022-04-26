# This cert needs to contain any alternate domains contained in
# var.holding_pages_domains
data "aws_acm_certificate" "holding_pages" {
  domain   = "${var.holding_pages_cert}.${data.terraform_remote_state.acc.outputs.public_domain_name}"
  provider = aws.us-east-1
  statuses = [
    "ISSUED",
  ]
}

data "aws_acm_certificate" "reporting_xe_cert" {
  count    = var.environment == "prod" ? "1" : "0"
  domain   = "${var.reporting_xe_cert_name}.${var.public_domain_name}"
  statuses = [
    "ISSUED",
  ]
}
