module "cpc_sftpplus_subnets" {
  source             = "../../modules/subnets"
  name               = "cpc_sftp"
  project            = "${var.project}"
  environment        = "${var.environment}"
  component          = "${var.component}"
  vpc_id             = "${aws_vpc.vpc.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  cidrs              = ["${var.cpc_sftp_subnets_cidrs}"]
  route_tables       = ["${aws_route_table.public.id}"]
}
