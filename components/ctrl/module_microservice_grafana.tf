module "grafana" {
  source = "../../modules/microservice"

  name        = "grafana"
  region      = var.aws_region
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id = aws_vpc.ctrl.id

  availability_zones = data.aws_availability_zones.available.names

  subnets_cidrs = var.ctrl_grafana_subnets

  subnets_route_tables = aws_route_table.private.*.id

  lc_ami_id        = data.aws_ami.grafana.image_id
  lc_instance_type = var.grafana_instance_type
  lc_user_data     = data.cloudinit_config.grafana.rendered
  lc_spot_price    = var.spot_pricing[var.grafana_instance_type]

  lc_additional_sg_ids = [
    aws_security_group.core.id,
  ]

  asg_size_min               = var.grafana_asg_min_size
  asg_size_desired_on_create = var.grafana_asg_min_size
  asg_size_max               = var.grafana_asg_max_size

  default_tags = local.default_tags

  asg_default_tags = local.asg_default_tags
}

