resource "aws_route53_record" "holding_pages" {

  name    = format("%s-%s", "maintenance", var.environment)

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.holding_pages.domain_name
    zone_id                = aws_cloudfront_distribution.holding_pages.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "holding_pages_findnearest" {
  count   = contains(var.holdingpageenv, var.environment) ? 1 : 0
  name    = format("%s-%s", "findnearest", var.environment)

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.holding_pages.domain_name
    zone_id                = aws_cloudfront_distribution.holding_pages.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "holding_pages_dsa" {
  count   = contains(var.holdingpageenv, var.environment) ? 1 : 0
  name    = format("%s-%s", "dsa", var.environment)

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.holding_pages.domain_name
    zone_id                = aws_cloudfront_distribution.holding_pages.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "holding_pages_driver_practical" {
  count   = contains(var.holdingpageenv, var.environment) ? 1 : 0
  name    = format("%s-%s", "driver-practical", var.environment)

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.holding_pages.domain_name
    zone_id                = aws_cloudfront_distribution.holding_pages.hosted_zone_id
    evaluate_target_health = true
  }
}
