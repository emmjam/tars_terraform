# Define some publci facing ALB subnets
module "alb_public_subnets" {
  source             = "../../modules/subnets"
  name               = "alb-public"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.vpc.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  cidrs              = ["${var.alb_public_subnets_cidrs}"]
  route_tables       = ["${aws_route_table.public.id}"]
}
