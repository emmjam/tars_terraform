resource "aws_acm_certificate" "reporting_xe_cert" {
  count             = var.environment == "prod" ? "1" : "0"
  domain_name       = "${var.reporting_xe_cert_name}.${var.public_domain_name}"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "reporting_xe_cert" {
  for_each = {
    for dvo in flatten([
      for cert in aws_acm_certificate.reporting_xe_cert: cert.domain_validation_options
    ]): dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 300
  type            = each.value.type
  zone_id         = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
}

resource "aws_acm_certificate_validation" "reporting_xe_cert" {
  count                   = var.environment == "prod" ? "1" : "0"
  certificate_arn         = aws_acm_certificate.reporting_xe_cert[count.index].arn
  validation_record_fqdns = [for record in aws_route53_record.reporting_xe_cert : record.fqdn]
}