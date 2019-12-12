data "aws_acm_certificate" "mgmt_mgmt_tars_dvsa_aws" {
  domain = var.nexus_domain_name

  statuses = [
    "ISSUED",
  ]
}

