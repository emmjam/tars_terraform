# TARS Messaging subnets
module "tars_messaging_subnets" {
  source             = "../../modules/subnets"
  name               = "tars_messaging"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.vpc.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  cidrs              = ["${var.tars_messaging_subnets_cidrs}"]
  route_tables       = ["${aws_route_table.messaging.id}"]
}
