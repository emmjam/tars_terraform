module "microservice_nexus" {
  source = "../../modules/microservice"

  region      = var.aws_region
  project     = var.project
  environment = var.environment
  component   = var.component

  name = "nexus"

  asg_default_tags = local.asg_default_tags

  asg_size_desired_on_create = var.nexus_config["asg_desired"]
  asg_size_max               = var.nexus_config["asg_max"]
  asg_size_min               = var.nexus_config["asg_min"]

  availability_zones = data.aws_availability_zones.available.names

  lc_ami_id        = data.aws_ami.nexus.image_id
  lc_instance_type = var.nexus_config["instance_type"]
  lc_user_data     = data.cloudinit_config.nexus.rendered

  # lifecycle_hook_launching_default_result = "CONTINUE" # Nexus is rather special. Malfunctioning is better than dead.
  # lifecycle_hook_launching_enabled        = "1"
  # lifecycle_hook_launching_timeout        = "900"
  # failed_lifecycle_action_sns_topic       = aws_sns_topic.alerts.arn

  subnets_cidrs = var.nexus_subnets_cidrs

  subnets_map_public_ip_on_launch = "false"

  subnets_route_tables = aws_route_table.private_nat.*.id

  vpc_id = aws_vpc.mgmt.id

  default_tags = merge(local.default_tags)
}

