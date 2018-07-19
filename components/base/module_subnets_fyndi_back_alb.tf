# subnets
module "fyndi_back_alb_subnets" {
  source             = "../../modules/subnets"
  name               = "fyndi_back_alb"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.vpc.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  cidrs              = ["${var.fyndi_back_alb_subnets_cidrs}"]
  route_tables       = ["${aws_route_table.private_nonat.id}"]
}
