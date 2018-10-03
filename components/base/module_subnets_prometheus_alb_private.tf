module "subnets_prometheus_alb_private" {
  source             = "../../modules/subnets"
  name               = "prometheus-alb-private"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.vpc.id}"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  cidrs = [
    "${var.prometheus_alb_private_cidrs}",
  ]

  route_tables = [
    "${aws_route_table.private_nat.*.id}",
  ]
}
