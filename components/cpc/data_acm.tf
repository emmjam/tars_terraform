# Get the tars ACM cert
data "aws_acm_certificate" "nonprod_tars_dvsacloud_uk" {
  domain = "${var.cert_name}.${data.terraform_remote_state.acc.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

data "aws_acm_certificate" "cpc_front_dvsa_internet" {
  domain = "${var.cpc_dvsa_internet_cert}.${data.terraform_remote_state.acc.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

data "aws_acm_certificate" "cpc_tars_dvsacloud_uk" {
  domain = "${local.dva_dns_short_name}.${data.terraform_remote_state.acc.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

data "aws_acm_certificate" "cpc_tars_dvsa_aws" {
  domain = "${var.cpc_private_cert}.${var.private_cert_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

