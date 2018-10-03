# Subnets for the IBS RDS DB's
module "subnets_ibs_rds" {
  source = "../../modules/subnets"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"
  name        = "ibs-rds"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  cidrs = [
    "${var.ibs_db_subnets_cidrs}",
  ]

  route_tables = [
    "${aws_route_table.private_nonat.id}",
  ]

  vpc_id       = "${aws_vpc.vpc.id}"
  default_tags = "${local.default_tags}"
}
