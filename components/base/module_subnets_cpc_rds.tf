# Subnets for the RDS DB's
module "subnets_cpc_rds" {
  source = "../../modules/subnets"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"
  name        = "cpc_rds"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  cidrs = [
    "${var.cpc_rds_subnets_cidrs}",
  ]

  route_tables = [
    "${aws_route_table.private_nonat.id}"
  ]

  vpc_id = "${aws_vpc.vpc.id}"

  # Apply default tags, and merge with additional tags
  default_tags = "${merge(
    var.default_tags,
    map(
      "Component", var.component
    )
  )}"
}
