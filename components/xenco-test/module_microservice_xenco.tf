# Create the xenco dev server
module "xenconode" {
  source = "../../modules/microservice"

  name        = "xenconode"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id               = "${data.terraform_remote_state.base.vpc_id}"
  availability_zones   = "${data.aws_availability_zones.available.names}"
  subnets_cidrs        = "${var.xenco_subnets_cidrs}"
  subnets_route_tables = [ "${data.terraform_remote_state.base.public_route_table_id}" ]

  lc_ami_id        = "${lookup(var.xenconode,"ami_id")}"
  lc_instance_type = "${lookup(var.xenconode,"instance_type")}"
  lc_user_data     = "${data.template_cloudinit_config.xenco.rendered}"

  asg_size_min               = "${lookup(var.xenconode,"asg_min_size")}"
  asg_size_desired_on_create = "${lookup(var.xenconode,"asg_max_size")}"
  asg_size_max               = "${lookup(var.xenconode,"asg_max_size")}"

  subnets_map_public_ip_on_launch = true
  lc_key_name = "${lookup(var.xenconode,"key_name")}"

  default_tags = "${local.default_tags}"
}
