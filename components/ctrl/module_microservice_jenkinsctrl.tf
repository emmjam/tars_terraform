module "jenkinsnode" {
  source = "../../modules/microservice"

  name        = "jenkinsctrl"
  region      = var.aws_region
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id = aws_vpc.ctrl.id

  availability_zones = data.aws_availability_zones.available.names

  subnets_cidrs = var.jenkinsctrl_subnets_cidrs

  subnets_route_tables = list(aws_route_table.private_nat.id)

  lc_ami_id        = data.aws_ami.jenkinsctrl.image_id
  lc_instance_type = var.jenkinsctrl_instance_type
  lc_user_data     = data.cloudinit_config.jenkinsctrl.rendered

  lc_additional_sg_ids = [
    aws_security_group.core.id,
  ]
  #lt_spot_price    = lookup(var.spot_pricing, var.jenkinsctrl_instance_type)

  asg_size_min               = var.jenkinsctrl_asg_min_size
  asg_size_desired_on_create = var.jenkinsctrl_asg_min_size
  asg_size_max               = var.jenkinsctrl_asg_max_size

  default_tags = local.default_tags

  asg_default_tags = local.asg_default_tags
}

