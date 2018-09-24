# Get the tars ACM cert
data "aws_acm_certificate" "nonprod_tars_dvsacloud_uk" {
  domain   = "${var.cert_name}.${data.terraform_remote_state.acc.public_domain_name}"
  statuses = ["ISSUED"]
}

data "aws_acm_certificate" "tars_dvsacloud_uk" {
  domain   = "${var.tars_cert}.${data.terraform_remote_state.acc.public_domain_name}"
  statuses = ["ISSUED"]
}