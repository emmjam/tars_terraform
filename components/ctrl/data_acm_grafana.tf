# Get the tars ACM cert
data "aws_acm_certificate" "grafana_acm" {
  domain = "${var.grafana_cert_name}.${data.terraform_remote_state.acc.outputs.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

