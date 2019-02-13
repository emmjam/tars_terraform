module "microservice_jmeter" {
  source = "../../modules/microservice"

  name        = "jmeter"
  region      = "${var.aws_region}"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  asg_default_tags = [
    "${local.asg_default_tags}",
  ]

  default_tags = "${local.default_tags}"

  asg_size_desired_on_create = "${var.jmeter_asg_size_desired_on_create}"
  asg_size_max               = "${var.jmeter_asg_size_max}"
  asg_size_min               = "${var.jmeter_asg_size_min}"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  lc_additional_sg_ids = [
    "${aws_security_group.core.id}",
  ]

  cwl_names = [
    "/cloud-init-output",
  ]

  cwl_retention_days = "30"

  lifecycle_hook_launching_default_result = "ABANDON"
  lifecycle_hook_launching_enabled        = "1"
  lifecycle_hook_launching_timeout        = "500"
  failed_lifecycle_action_sns_topic       = "${aws_sns_topic.alerts.arn}"

  lc_ami_id        = "${data.aws_ami.jmeter.image_id}"
  lc_instance_type = "${var.jmeter_instance_type}"
  lc_user_data     = "${data.template_cloudinit_config.jmeter.rendered}"

  subnets_cidrs = [
    "${var.jmeter_subnets_cidrs}",
  ]

  subnets_map_public_ip_on_launch = "false"

  subnets_route_tables = [
    "${aws_route_table.private_natgw.id}",
  ]

  vpc_id = "${aws_vpc.vpc.id}"
}
