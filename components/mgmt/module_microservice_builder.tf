module "builder" {
  source = "../../modules/microservice"

  name        = "builder"
  region      = var.aws_region
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id = aws_vpc.mgmt.id

  availability_zones = data.aws_availability_zones.available.names

  subnets_cidrs = var.builder_subnets_cidrs

  subnets_route_tables = aws_route_table.private_nat.*.id

  lc_ami_id        = data.aws_ami.builder.image_id
  lc_instance_type = var.builder["instance_type"]
  lc_ebs_size      = var.builder["ebs_volume_size"]
  lc_user_data     = data.template_cloudinit_config.builder.rendered
  lc_additional_sg_ids = [
    aws_security_group.common.id,
  ]

  asg_size_min               = var.builder["asg_min_size"]
  asg_size_desired_on_create = var.builder["asg_min_size"]
  asg_size_max               = var.builder["asg_max_size"]

  default_tags = local.default_tags

  asg_default_tags = local.asg_default_tags
}

