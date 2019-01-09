module "sftpplus_svr" {
  source = "../../modules/microservice"

  name        = "sftpplus"
  region      = "${var.aws_region}"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id = "${data.terraform_remote_state.base.vpc_id}"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  subnets_cidrs = [
    "${var.cpc_sftp_subnets_cidrs}",
  ]

  subnets_route_tables = [
    "${data.terraform_remote_state.base.public_route_table_id}",
  ]

  lc_ami_id        = "${data.aws_ami.sftpplus_svr.image_id}"
  lc_instance_type = "${var.sftpplus-svr_instance_type}"
  lc_user_data     = "${data.template_cloudinit_config.sftpplus_svr.rendered}"

  lc_additional_sg_ids = [
    "${data.terraform_remote_state.base.core_sg_id}",
  ]

  asg_size_min               = "${var.sftpplus-svr_asg_min_size}"
  asg_size_desired_on_create = "${var.sftpplus-svr_asg_min_size}"
  asg_size_max               = "${var.sftpplus-svr_asg_max_size}"
  asg_load_balancers         = []

  default_tags = "${local.default_tags}"
}
