module "ibs" {
  source = "../../modules/microservice"

  name        = "ibs"
  region      = "${var.aws_region}"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id             = "${data.terraform_remote_state.base.vpc_id}"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  subnets_cidrs = [
    "${var.ibs_subnets_cidrs}",
  ]

  subnets_route_tables = [
    "${data.terraform_remote_state.base.private_nat_route_table_id}",
  ]

  lc_ami_id        = "${data.aws_ami.ibs.image_id}"
  lc_instance_type = "${var.ibs_instance_type}"
  lc_user_data     = "${data.template_cloudinit_config.ibs.rendered}"

  lc_additional_sg_ids = [
    "${data.terraform_remote_state.base.core_sg_id}",
  ]

  lifecycle_hook_launching_default_result = "ABANDON"
  lifecycle_hook_launching_enabled        = "1"
  lifecycle_hook_launching_timeout        = "500"
  failed_lifecycle_action_sns_topic       = "${data.terraform_remote_state.base.sns_alerts_arn}"

  asg_size_min               = "${var.ibs_asg_min_size}"
  asg_size_desired_on_create = "${var.ibs_asg_min_size}"
  asg_size_max               = "${var.ibs_asg_max_size}"
  asg_load_balancers         = []

  default_tags = "${local.default_tags}"

  asg_default_tags  = [
    "${var.asg_default_tags}",
  ]
}
