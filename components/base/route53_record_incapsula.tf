# Temporary record until we secure a public domain
# for the prep environment
resource "aws_route53_record" "dsa_incapsula" {
  count = var.dsa_incap_cname != "" ? 1 : 0

  name = format("dsa-%s", var.environment)

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "CNAME"
  ttl     = "300"

  records = [
    var.dsa_incap_cname,
  ]
}

# Temporary record until we secure a public domain
# for the prep environment
resource "aws_route53_record" "findnearest_incapsula" {
  count = var.findnearest_incap_cname != "" ? 1 : 0

  name = format("findnearest-%s", var.environment)

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "CNAME"
  ttl     = "300"

  records = [
    var.findnearest_incap_cname,
  ]
}

# Temporary record until we secure a public domain
# for the prep environment
resource "aws_route53_record" "driverpractical_incapsula" {
  count = var.driverpractical_incap_cname != "" ? 1 : 0

  name = format("driverpractical-%s", var.environment)

  zone_id = data.terraform_remote_state.acc.outputs.public_domain_name_zone_id
  type    = "CNAME"
  ttl     = "300"

  records = [
    var.driverpractical_incap_cname,
  ]
}

resource "aws_route53_record" "dsa_incapsula_private" {
  count = var.dsa_incap_cname != "" ? 1 : 0

  name = format("dsa-%s", var.environment)

  zone_id = data.terraform_remote_state.ctrl.outputs.private_r53_zone[0]
  type    = "CNAME"
  ttl     = "300"

  records = [
    var.dsa_incap_cname,
  ]
}

# Temporary record until we secure a public domain
# for the prep environment
resource "aws_route53_record" "findnearest_incapsula_private" {
  count = var.findnearest_incap_cname != "" ? 1 : 0

  name = format("findnearest-%s", var.environment)

  zone_id = data.terraform_remote_state.ctrl.outputs.private_r53_zone[0]
  type    = "CNAME"
  ttl     = "300"

  records = [
    var.findnearest_incap_cname,
  ]
}

# Temporary record until we secure a public domain
# for the prep environment
resource "aws_route53_record" "driverpractical_incapsula_private" {
  count = var.driverpractical_incap_cname != "" ? 1 : 0

  name = format("driverpractical-%s", var.environment)

  zone_id = data.terraform_remote_state.ctrl.outputs.private_r53_zone[0]
  type    = "CNAME"
  ttl     = "300"

  records = [
    var.driverpractical_incap_cname,
  ]
}

