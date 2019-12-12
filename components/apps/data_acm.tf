# Get the tars ACM cert
data "aws_acm_certificate" "nonprod_tars_dvsacloud_uk" {
  domain = "${var.cert_name}.${data.terraform_remote_state.acc.outputs.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

data "aws_acm_certificate" "fyndi_tars_dvsacloud_uk" {
  domain = "${var.fyndi_cert}.${data.terraform_remote_state.acc.outputs.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

data "aws_acm_certificate" "ibs_tars_dvsacloud_uk" {
  domain = "${var.ibs_cert}.${data.terraform_remote_state.acc.outputs.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

