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
  aws_account_id   = "${var.aws_account_id}"
  kms_key_id       = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"

  ami_id           = "${data.aws_ami.squidnat.image_id}"
  instance_type    = "${var.squidnat_instance_type}"
  root_domain_name = "${var.private_domain_name}"
  route_table_id   = "${aws_route_table.private_natgw.id}"
  subnets_cidrs    = "${var.squidnat_subnets_cidrs}"
  vpc_id           = "${aws_vpc.vpc.id}"
  zone_id          = "${aws_route53_zone.vpc.zone_id}"

  additional_sg_ids = [
    "${aws_security_group.core.id}",
  ]

  whitelist_cidrs = [
  ]

  default_tags = "${merge(
    var.default_tags,
    map(
      "Component", var.component
    )
  )}"
}
