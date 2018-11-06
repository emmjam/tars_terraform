# A subnet tuple for the microservice
module "subnets" {
  source = "../../modules/subnets"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"
  name        = "${var.name}"

  availability_zones = [
    "${var.availability_zones}",
  ]

  cidrs = [
    "${var.subnets_cidrs}",
  ]

  map_public_ip_on_launch = "${var.subnets_map_public_ip_on_launch}"

  route_tables = [
    "${var.subnets_route_tables}",
  ]

  vpc_id = "${var.vpc_id}"

  default_tags = "${local.default_tags}"
}
