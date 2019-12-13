# This cert needs to contain any alternate domains contained in
# var.holding_pages_domains
data "aws_acm_certificate" "holding_pages" {
  domain   = "${var.holding_pages_cert}.${data.terraform_remote_state.acc.outputs.public_domain_name}"
  provider = aws.us-east-1
  statuses = [
    "ISSUED",
  ]
}

