# Get the tars ACM cert
data "aws_acm_certificate" "prometheus" {
  domain   = "${var.prometheus_cert_name}.${data.terraform_remote_state.acc.public_domain_name}"
  statuses = ["ISSUED"]
}
