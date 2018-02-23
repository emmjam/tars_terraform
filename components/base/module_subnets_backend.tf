module "tars_backend_nat_subnets" {
  source             = "../../modules/subnets"
  name               = "tars_backend_nat"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.vpc.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  cidrs              = ["${var.nat_subnets_cidrs}"]
  route_tables       = ["${aws_route_table.public.id}"]
}
