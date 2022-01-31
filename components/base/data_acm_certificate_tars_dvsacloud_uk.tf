data "aws_acm_certificate" "tars_dvsacloud_uk" {
  domain = format("%s.%s", var.cert_name, var.public_domain_name)
  statuses = [
    "ISSUED"
  ]
}
