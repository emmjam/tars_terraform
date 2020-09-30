# Get the tars ACM cert
data "aws_acm_certificate" "grafana_acm" {
  count  = var.account_environment != "mgmt" ? 1 : 0
  domain = "${var.grafana_cert_name}.${data.terraform_remote_state.acc.outputs.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

