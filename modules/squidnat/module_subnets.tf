################################################################################
#
# Squid NAT Subnets
#
################################################################################

module "subnets" {
  source = "../../modules/subnets"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"
  name        = "${var.module}"

  availability_zones = [
    "${data.aws_availability_zones.azs.names}",
  ]

  cidrs = [
    "${var.subnets_cidrs}",
  ]

  route_tables = [
    "${var.route_table_id}",
  ]

  vpc_id = "${var.vpc_id}"

  # Default tags don't need to change.
  # The module will set its own Module tag as well as others and constructs its own Name tags
  default_tags = "${var.default_tags}"
}
