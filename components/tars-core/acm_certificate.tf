# Get the tars ACM cert
data "aws_acm_certificate" "nonprod_tars_dvsacloud_uk" {
  domain = "${var.cert_name}.${data.terraform_remote_state.acc.outputs.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

data "aws_acm_certificate" "tars_public" {
  domain = "${var.public_cert}.${data.terraform_remote_state.acc.outputs.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

data "aws_acm_certificate" "tars_dvsacloud_uk" {
  domain = "${var.public_cert}.${data.terraform_remote_state.acc.outputs.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

data "aws_acm_certificate" "tars-core-private_tars_dvsa_aws" {
  domain = "${var.tars_private_cert}.${var.private_cert_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

data "aws_acm_certificate" "payments_nonprod_tars_dvsacloud_uk" {
  domain = "${var.payments_cert_name}.${data.terraform_remote_state.acc.outputs.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

data "aws_acm_certificate" "driver_services_cert" {
  count = var.drv_svc_enabled ? 1 : 0

  domain = "${local.driver_services_domain}"

  statuses = [
    "ISSUED",
  ]
}
