# TARS backend/batch tier subnets
module "tars_backend_subnets" {
  source             = "../../modules/subnets"
  name               = "tars_backend"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.vpc.id}"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  cidrs = [
    "${var.tars_backend_subnets_cidrs}",
  ]

  route_tables = [
    "${aws_route_table.private_nat.*.id}",
  ]
}
