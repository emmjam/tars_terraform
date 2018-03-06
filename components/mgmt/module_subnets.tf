module "nat_subnets" {
  source             = "../../modules/subnets"
  name               = "nat"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.mgmt.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  cidrs              = ["${var.nat_subnets_cidrs}"]
  route_tables       = ["${aws_route_table.public.id}"]
}

module "bastion_elb_subnets" {
  source             = "../../modules/subnets"
  name               = "bastion-elb"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.mgmt.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  cidrs              = ["${var.bastion_elb_subnets_cidrs}"]
  route_tables       = ["${aws_route_table.public.id}"]
}

module "alb_public_subnets" {
  source             = "../../modules/subnets"
  name               = "alb-public"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.mgmt.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  cidrs              = ["${var.alb_public_subnets_cidrs}"]
  route_tables       = ["${aws_route_table.public.*.id}"]
}
