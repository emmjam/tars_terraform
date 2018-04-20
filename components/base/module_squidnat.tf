################################################################################
#
# Squid NAT
#
################################################################################

module "squidnat" {
  source = "../../modules/squidnat"

  project          = "${var.project}"
  environment      = "${var.environment}"
  component        = "${var.component}"

  ami_id           = "${data.aws_ami.squidnat.image_id}"
  instance_type    = "${var.squidnat_instance_type}"
  root_domain_name = "${var.private_domain_name}"
  route_table_id   = "${aws_route_table.public.id}"
  subnets_cidrs    = "${var.squidnat_subnets_cidrs}"
  vpc_id           = "${aws_vpc.vpc.id}"
  zone_id          = "${aws_route53_zone.vpc.zone_id}"

  additional_sg_ids = [
    "${aws_security_group.core.id}",
  ]

  whitelist_cidrs = [
    "${var.jenkinsnode_subnets_cidrs}",
  ]

  default_tags = "${merge(
    var.default_tags,
    map(
      "Component", var.component
    )
  )}"
}
