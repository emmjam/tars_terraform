# Get the tars ACM cert
data "aws_acm_certificate" "nonprod_tars_dvsacloud_uk" {
  domain = "${var.cert_name}.${data.terraform_remote_state.acc.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

data "aws_acm_certificate" "tars-core-pdf_tars_dvsa_aws" {
  domain = "${var.tars_pdf_cert}.${var.private_cert_domain_name}"

  statuses = [
    "ISSUED",
  ]
}
