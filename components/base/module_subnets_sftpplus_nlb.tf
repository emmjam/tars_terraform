module "sftpplus_nlb" {
  source             = "../../modules/subnets"
  name               = "sftpplus_nlb"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.vpc.id}"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  cidrs = [
    "${var.sftpplus_nlb_subnets_cidrs}",
  ]

  route_tables = [
    "${aws_route_table.public.*.id}",
  ]
}
