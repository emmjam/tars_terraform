data "aws_acm_certificate" "nonprod_tars_dvsacloud_uk" {
  domain   = "*.${data.terraform_remote_state.acc.public_domain_name}"
  statuses = ["ISSUED"]
}
