# Create the xenco dev server
module "xenco" {
  source = "../../modules/microservice"

  name        = "xenco"
  region      = "${var.aws_region}"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id             = "${data.terraform_remote_state.base.vpc_id}"
  availability_zones = "${data.aws_availability_zones.available.names}"
  subnets_cidrs      = "${var.xenco_subnets_cidrs}"

  subnets_route_tables = [
    "${data.terraform_remote_state.base.private_nonat_route_table_id}",
  ]

  lc_additional_sg_ids = [
    "${data.terraform_remote_state.base.core_sg_id}",
  ]

  lc_ami_id        = "${data.aws_ami.xenco.id}"
  lc_instance_type = "${var.xenco_instance_type}"
  lc_user_data     = "${data.template_cloudinit_config.xenco.rendered}"

  lifecycle_hook_launching_default_result = "ABANDON"
  lifecycle_hook_launching_enabled        = "1"
  lifecycle_hook_launching_timeout        = "500"
  failed_lifecycle_action_sns_topic       = "${data.terraform_remote_state.base.sns_alerts_arn}"

  asg_size_min               = "${var.xenco_asg_min_size}"
  asg_size_desired_on_create = "${var.xenco_asg_max_size}"
  asg_size_max               = "${var.xenco_asg_max_size}"

  subnets_map_public_ip_on_launch = true

  lc_key_name = "${var.xenco_key_name}"

  default_tags = "${local.default_tags}"
}
