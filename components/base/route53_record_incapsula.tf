# Temporary record until we secure a public domain
# for the prep environment
resource "aws_route53_record" "dsa_incapsula" {
  count = "${var.dsa_incap_cname != "" ? 1 : 0}"

  name = "${format(
    "dsa-%s",
    var.environment,
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "CNAME"

  records = [
    "${var.dsa_incap_cname}"
  ]
}

# Temporary record until we secure a public domain
# for the prep environment
resource "aws_route53_record" "findnearest_incapsula" {
  count = "${var.findnearest_incap_cname != "" ? 1 : 0}"

  name = "${format(
    "findnearest-%s",
    var.environment
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "CNAME"

  records = [
    "${var.findnearest_incap_cname}"
  ]
}

# Temporary record until we secure a public domain
# for the prep environment
resource "aws_route53_record" "driverpractical_incapsula" {
   count = "${var.driverpractical_incap_cname != "" ? 1 : 0}"

  name = "${format(
    "driverpractical-%s",
    var.environment,
  )}"

  zone_id = "${data.terraform_remote_state.acc.public_domain_name_zone_id}"
  type    = "CNAME"

  records = [
    "${var.driverpractical_incap_cname}"
  ]
}