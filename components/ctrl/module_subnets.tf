module "nat_subnets" {
  source             = "../../modules/subnets"
  name               = "nat"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.ctrl.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  cidrs              = ["${var.ctrl_nat_subnets_cidrs}"]
  route_tables       = ["${aws_route_table.public.id}"]
}

module "bastion_elb_subnets" {
  source             = "../../modules/subnets"
  name               = "bastion-elb"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.ctrl.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  cidrs              = ["${var.bastion_elb_subnets_cidrs}"]
  route_tables       = ["${aws_route_table.public.id}"]
}

module "grafana_alb_subnets" {
  source             = "../../modules/subnets"
  name               = "grafana-alb"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.ctrl.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  cidrs              = ["${var.grafana_alb_subnets_cidrs}"]
  route_tables       = ["${aws_route_table.public.id}"]
}