data "aws_acm_certificate" "tars_dvsacloud_uk" {
  domain = "*.${data.terraform_remote_state.acc.outputs.public_domain_name}"

  statuses = [
    "ISSUED",
  ]
}

