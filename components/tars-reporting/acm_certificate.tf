# Get the tars ACM cert
data "aws_acm_certificate" "nonprod_tars_dvsacloud_uk" {
  domain = "${var.bobj_cert}.${data.terraform_remote_state.acc.outputs.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

