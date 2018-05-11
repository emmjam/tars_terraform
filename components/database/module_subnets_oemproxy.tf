module "oemproxysubnet" {
  source = "../../modules/subnets"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"
  name        = "oemproxy"

  vpc_id                  = "${aws_vpc.vpc.id}"
  availability_zones      = ["${data.aws_availability_zones.available.names}"]
  cidrs                   = ["10.10.0.32/28"]
  map_public_ip_on_launch = "true"
  route_tables            = ["${aws_route_table.public.id}"]

  default_tags = "${var.default_tags}"
}
