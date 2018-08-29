# Get the tars ACM cert
data "aws_acm_certificate" "grafana_acm" {
  domain   = "grafana.${data.terraform_remote_state.acc.public_domain_name}"
  statuses = ["ISSUED"]
}
